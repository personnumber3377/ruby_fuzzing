      def foo &b
      end
      h1 = {}; h2 = {}
      ObjectSpace.count_objects(h1) # rehearsal
      GC.start; GC.disable          # to disable GC while foo{}
      ObjectSpace.count_objects(h1)
      foo{}
      ObjectSpace.count_objects(h2)

      assert_equal 0, h2[:T_DATA] - h1[:T_DATA] # Proc is T_DATA
    END
  end

  def test_peephole_optimization_without_trace
    assert_ruby_status [], <<-END
      RubyVM::InstructionSequence.compile_option = {trace_instruction: false}
      eval "def foo; 1.times{|(a), &b| nil && a}; end"
    END
  end

  def test_clear_unreachable_keyword_args
    assert_ruby_status [], <<-END, timeout: 60
      script =  <<-EOS
        if true
        else
          foo(k1:1)
        end
      EOS
      GC.stress = true
      30.times{
        RubyVM::InstructionSequence.compile(script)
      }
    END
  end

  def test_callinfo_unreachable_path
    assert_separately([], "#{<<~"begin;"}\n#{<<~'end;'}")
    begin;
      iseq = RubyVM::InstructionSequence.compile("if false; foo(bar: :baz); else :ok end")
      bin = iseq.to_binary
      iseq = RubyVM::InstructionSequence.load_from_binary(bin)
      assert_instance_of(RubyVM::InstructionSequence, iseq)
      assert_equal(:ok, iseq.eval)
    end;
  end

  def test_side_effect_in_popped_splat
    bug = '[ruby-core:84340] [Bug #14201]'
    eval("{**(bug = nil; {})};42")
    assert_nil(bug)

    bug = '[ruby-core:85486] [Bug #14459]'
    h = {}
    assert_equal(bug, eval('{ok: 42, **h}; bug'))
    assert_equal(:ok, eval('{ok: bug = :ok, **h}; bug'))
    assert_empty(h)
  end

  def test_overwritten_blockparam
    obj = Object.new
    def obj.a(&block)
      block = 1
      return :ok if block
      :ng
    end
    assert_equal(:ok, obj.a())
  end

  def test_blockparam_in_rescue
    obj = Object.new
    def obj.foo(&b)
      raise
    rescue
      b.call
    end
    result = nil
    assert_equal(42, obj.foo {result = 42})
    assert_equal(42, result)
  end

  def test_unconditional_branch_to_leave_block
    assert_valid_syntax("#{<<~"begin;"}\n#{<<~'end;'}")
    begin;
      tap {true || tap {}}
    end;
  end

  def test_jump_elimination_with_optimized_out_block
    x = Object.new
    def x.bug(obj)
      if obj || obj
        obj = obj
      else
        raise "[ruby-core:87830] [Bug #14897]"
      end
      obj
    end
    assert_equal(:ok, x.bug(:ok))
  end

  def test_jump_elimination_with_optimized_out_block_2
    x = Object.new
    def x.bug
      a = "aaa"
      ok = :NG
      if a == "bbb" || a == "ccc" then
        a = a
      else
        ok = :ok
      end
      ok
    end
    assert_equal(:ok, x.bug)
  end

  def test_peephole_jump_after_newarray
    i = 0
    %w(1) || 2 while (i += 1) < 100
    assert_equal(100, i)
  end

  def test_optimized_empty_ensure
    assert_separately([], "#{<<~"begin;"}\n#{<<~'end;'}", timeout: 10)
    begin;
      assert_raise(RuntimeError) {
        begin raise ensure nil if nil end
      }
    end;
  end

  def test_optimized_rescue
    assert_in_out_err("", "#{<<~"begin;"}\n#{<<~'end;'}", [], /END \(RuntimeError\)/)
    begin;
      if false
        begin
          require "some_mad_stuff"
        rescue LoadError
          puts "no mad stuff loaded"
        end
      end

      raise  "END"
    end;
  end

  class Objtostring
  end

  def test_objtostring_immediate
    assert_raise(NoMethodError){"#{BasicObject.new}"}
    assert_redefine_method('Symbol', 'to_s', <<-'end')
      assert_match %r{\A#<Symbol:0x[0-9a-f]+>\z}, "#{:foo}"
    end
    assert_redefine_method('NilClass', 'to_s', <<-'end')
      assert_match %r{\A#<NilClass:0x[0-9a-f]+>\z}, "#{nil}"
    end
    assert_redefine_method('TrueClass', 'to_s', <<-'end')
      assert_match %r{\A#<TrueClass:0x[0-9a-f]+>\z}, "#{true}"
    end
    assert_redefine_method('FalseClass', 'to_s', <<-'end')
      assert_match %r{\A#<FalseClass:0x[0-9a-f]+>\z}, "#{false}"
    end
  end

  def test_objtostring_fixnum
    assert_redefine_method('Integer', 'to_s', <<-'end')
      (-1..10).each { |i|
        assert_match %r{\A#<Integer:0x[0-9a-f]+>\z}, "#{i}"
      }
    end
  end

  def test_objtostring
    assert_equal "TestRubyOptimization::Objtostring", "#{Objtostring}"
    assert_match %r{\A#<Class:0x[0-9a-f]+>\z}, "#{Class.new}"
    assert_match %r{\A#<Module:0x[0-9a-f]+>\z}, "#{Module.new}"
    o = Object.new
    def o.to_s; 1; end
    assert_match %r{\A#<Object:0x[0-9a-f]+>\z}, "#{o}"
  end

  def test_opt_duparray_send_include_p
    [
      'x = :b; [:a, :b].include?(x)',
      '@c = :b; [:a, :b].include?(@c)',
      '@c = "b"; %i[a b].include?(@c.to_sym)',
      '[:a, :b].include?(self) == false',
    ].each do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_duparray_send/, insn)
      assert_no_match(/\bduparray\b/, insn)
      assert_equal(true, eval(code))
    end

    x, y = :b, :c
    assert_equal(true,  [:a, :b].include?(x))
    assert_equal(false, [:a, :b].include?(y))

    assert_in_out_err([], <<~RUBY, ["1,2", "3,3", "1,2", "4,4"])
      class Array
        prepend(Module.new do
          def include?(i)
            puts self.join(",")
            # Modify self to prove that we are operating on a copy.
            map! { i }
            puts self.join(",")
          end
        end)
      end
      def x(i)
        [1, 2].include?(i)
      end
      x(3)
      x(4)
    RUBY

    # Ensure raises happen correctly.
    assert_in_out_err([], <<~RUBY, ["will raise", "int 1 not 3"])
      class Integer
        undef_method :==
        def == x
          raise "int \#{self} not \#{x}"
        end
      end
      x = 3
      puts "will raise"
      begin
        p [1, 2].include?(x)
      rescue
        puts $!
      end
    RUBY
  end

  def test_opt_newarray_send_include_p
    [
      'b = :b; [:a, b].include?(:b)',
      # Use Object.new to ensure that we get newarray rather than duparray.
      'value = 1; [Object.new, true, "true", 1].include?(value)',
      'value = 1; [Object.new, "1"].include?(value.to_s)',
      '[Object.new, "1"].include?(self) == false',
    ].each do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_newarray_send/, insn)
      assert_no_match(/\bnewarray\b/, insn)
      assert_equal(true, eval(code))
    end

    x, y = :b, :c
    assert_equal(true,  [:a, x].include?(x))
    assert_equal(false, [:a, x].include?(y))

    assert_in_out_err([], <<~RUBY, ["1,3", "3,3", "1,4", "4,4"])
      class Array
        prepend(Module.new do
          def include?(i)
            puts self.join(",")
            # Modify self to prove that we are operating on a copy.
            map! { i }
            puts self.join(",")
          end
        end)
      end
      def x(i)
        [1, i].include?(i)
      end
      x(3)
      x(4)
    RUBY

    # Ensure raises happen correctly.
    assert_in_out_err([], <<~RUBY, ["will raise", "int 1 not 3"])
      class Integer
        undef_method :==
        def == x
          raise "int \#{self} not \#{x}"
        end
      end
      x = 3
      puts "will raise"
      begin
        p [1, x].include?(x)
      rescue
        puts $!
      end
    RUBY
  end

  def test_opt_new_with_safe_navigation
    payload = nil
    assert_nil payload&.new
  end

  def test_opt_new
    pos_initialize = "
      def initialize a, b
        @a = a
        @b = b
      end
    "
    kw_initialize = "
      def initialize a:, b:
        @a = a
        @b = b
      end
    "
    kw_hash_initialize = "
      def initialize a, **kw
        @a = a
        @b = kw[:b]
      end
    "
    pos_prelude = "class OptNewFoo; #{pos_initialize}; end;"
    kw_prelude = "class OptNewFoo; #{kw_initialize}; end;"
    kw_hash_prelude = "class OptNewFoo; #{kw_hash_initialize}; end;"
    [
      "#{pos_prelude} OptNewFoo.new 1, 2",
      "#{pos_prelude} a = 1; b = 2; OptNewFoo.new a, b",
      "#{pos_prelude} def optnew_foo(a, b) = OptNewFoo.new(a, b); optnew_foo 1, 2",
      "#{pos_prelude} def optnew_foo(*a) = OptNewFoo.new(*a); optnew_foo 1, 2",
      "#{pos_prelude} def optnew_foo(...) = OptNewFoo.new(...); optnew_foo 1, 2",
      "#{kw_prelude} def optnew_foo(**a) = OptNewFoo.new(**a); optnew_foo a: 1, b: 2",
      "#{kw_hash_prelude} def optnew_foo(*a, **b) = OptNewFoo.new(*a, **b); optnew_foo 1, b: 2",
    ].each do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_match(/opt_new/, insn)
      assert_match(/OptNewFoo:.+@a=1, @b=2/, iseq.eval.inspect)
      # clean up to avoid warnings
      Object.send :remove_const, :OptNewFoo
      Object.remove_method :optnew_foo if defined?(optnew_foo)
    end
    [
      'def optnew_foo(&) = OptNewFoo.new(&)',
      'def optnew_foo(a, ...) = OptNewFoo.new(a, ...)',
    ].each do |code|
      iseq = RubyVM::InstructionSequence.compile(code)
      insn = iseq.disasm
      assert_no_match(/opt_new/, insn)
    end
  end