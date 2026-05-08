#include "ruby.h"
#include "ruby/debug.h"

#include <stdint.h>
#include <stddef.h>
#include <string.h>

static int ruby_ready = 0;

static void
init_ruby_once(void)
{
    if (ruby_ready) return;

    int argc = 0;
    char **argv = NULL;

    ruby_sysinit(&argc, &argv);

    RUBY_INIT_STACK;
    ruby_init();
    ruby_init_loadpath();

    /*
      Optional stdlib/modules.
      Remove these if they slow startup too much.
    */
    int state = 0;

    rb_eval_string_protect(
        "begin\n"
        "  require 'json'\n"
        "  require 'stringio'\n"
        "  require 'digest'\n"
        "  require 'strscan'\n"
        "rescue LoadError\n"
        "end\n",
        &state
    );

    ruby_ready = 1;
}

static VALUE
compile_input(VALUE str)
{
    /*
      RubyVM::InstructionSequence.compile(str)
    */

    VALUE rubyvm =
        rb_const_get(rb_cObject, rb_intern("RubyVM"));

    VALUE iseq =
        rb_const_get(rubyvm,
                     rb_intern("InstructionSequence"));

    return rb_funcall(
        iseq,
        rb_intern("compile"),
        1,
        str
    );
}

int
LLVMFuzzerInitialize(int *argc, char ***argv)
{
    init_ruby_once();
    return 0;
}

int
LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
{
    if (size == 0 || size > 65536)
        return 0;

    /*
      Skip embedded NULs for now because some Ruby APIs
      still expect C strings internally.
    */
    if (memchr(data, '\0', size))
        return 0;

    /*
      Create Ruby UTF-8 string directly from fuzz input.
    */
    VALUE src =
        rb_utf8_str_new((const char *)data,
                        (long)size);

    int state = 0;

    rb_protect(compile_input, src, &state);

    /*
      Swallow ordinary Ruby exceptions.
      Native crashes still escape normally.
    */
    if (state) {
        rb_set_errinfo(Qnil);
    }

    /*
      Optional GC stress.
      Helps expose lifetime/UAF issues.
    */
    if ((rand() & 0xff) == 0) {
        rb_gc_start();
    }

    return 0;
}