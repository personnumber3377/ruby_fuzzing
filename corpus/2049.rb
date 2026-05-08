do
            RubyVM::YJIT.code_gc
            break # jit_exec_exception catches TAG_BREAK and re-enters JIT code
          end