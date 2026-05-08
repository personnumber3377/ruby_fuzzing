        pm_var = "outer scope variable"

        1.times { |;pm_var| pm_var = "inner scope variable"; pm_var }
      CODE
      )

      assert_prism_eval(<<-CODE
        pm_var = "outer scope variable"

        1.times { |;pm_var| pm_var = "inner scope variable"; pm_var }
        pm_var
      CODE
      )
    end

    def test_CallNode
      assert_prism_eval("to_s")

      # with arguments
      assert_prism_eval("eval '1'")

      # with arguments and popped
      assert_prism_eval("eval '1'; 1")

      # With different types of calling arguments
      assert_prism_eval(<<-CODE)
        def self.prism_test_call_node_double_splat(**); end
        prism_test_call_node_double_splat(b: 1, **{})
      CODE
      assert_prism_eval(<<-CODE)
        prism_test_call_node_double_splat(:b => 1)
      CODE

      assert_prism_eval(<<-CODE)
        def self.prism_test_call_node_splat(*); end
        prism_test_call_node_splat(*[], 1)
      CODE

      assert_prism_eval("prism_test_call_node_splat(*[], 1, 2)")

      assert_prism_eval(<<~RUBY)
        def self.prism_test_call_node_splat_and_double_splat(a, b, **opts); end
        prism_test_call_node_splat_and_double_splat(*[1], 2, **{})
      RUBY

      assert_prism_eval(<<-CODE)
        class Foo
          def []=(a, b)
            1234
          end
        end

        def self.foo(i, j)
          tbl = Foo.new
          tbl[i] = j
        end
        foo(1, 2)
      CODE

      assert_prism_eval(<<-CODE)
        class Foo
          def i=(a)
            1234
          end
        end

        def self.foo(j)
          tbl = Foo.new
          tbl.i = j
        end
        foo(1)
      CODE

      assert_prism_eval(<<-CODE)
        foo = Object.new
        def foo.[]=(k,v); 42; end
        foo.[]=(1,2)
      CODE

      # With splat inside of []=
      assert_prism_eval(<<~RUBY)
        obj = Object.new
        def obj.[]=(a, b); 10; end
        obj[*[1]] = 3
      RUBY

      assert_prism_eval(<<-CODE)
        def self.prism_opt_var_trail_hash(a = nil, *b, c, **d); end
        prism_opt_var_trail_hash("a")
        prism_opt_var_trail_hash("a", c: 1)
        prism_opt_var_trail_hash("a", "b")
        prism_opt_var_trail_hash("a", "b", "c")
        prism_opt_var_trail_hash("a", "b", "c", c: 1)
        prism_opt_var_trail_hash("a", "b", "c", "c" => 0, c: 1)
      CODE

      assert_prism_eval(<<-CODE)
        def self.foo(*args, **kwargs) = [args, kwargs]

        [
          foo(2 => 3),
          foo([] => 42),
          foo(a: 42, b: 61),
          foo(1, 2, 3, a: 42, "b" => 61),
          foo(:a => 42, :b => 61),
        ]
      CODE

      assert_prism_eval(<<-CODE)
        class PrivateMethod
          def initialize
            self.instance_var
          end
          private
          attr_accessor :instance_var
        end
        pm = PrivateMethod.new
        pm.send(:instance_var)
      CODE

      # Testing safe navigation operator
      assert_prism_eval(<<-CODE)
        def self.test_prism_call_node
          if [][0]&.first
            1
          end
        end
        test_prism_call_node
      CODE

      # Specialized instructions
      assert_prism_eval(%{-"literal"})
      assert_prism_eval(%{"literal".freeze})
    end

    def test_CallAndWriteNode
      assert_prism_eval(<<-CODE
        class PrismTestSubclass; end
        def PrismTestSubclass.test_call_and_write_node; end;
        PrismTestSubclass.test_call_and_write_node &&= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def PrismTestSubclass.test_call_and_write_node
          "str"
        end
        def PrismTestSubclass.test_call_and_write_node=(val)
          val
        end
        PrismTestSubclass.test_call_and_write_node &&= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def self.test_call_and_write_node; end;
        self.test_call_and_write_node &&= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def self.test_call_and_write_node
          "str"
        end
        def self.test_call_and_write_node=(val)
          val
        end
        self.test_call_and_write_node &&= 1
      CODE
      )

      assert_prism_eval(<<-CODE)
        def self.test_prism_call_node; end
        def self.test_prism_call_node=(val)
          val
        end
        self&.test_prism_call_node &&= 1
      CODE

      assert_prism_eval(<<-CODE)
        def self.test_prism_call_node
          2
        end
        def self.test_prism_call_node=(val)
          val
        end
        self&.test_prism_call_node &&= 1
      CODE
    end

    def test_CallOrWriteNode
      assert_prism_eval(<<-CODE
        class PrismTestSubclass; end
        def PrismTestSubclass.test_call_or_write_node; end;
        def PrismTestSubclass.test_call_or_write_node=(val)
          val
        end
        PrismTestSubclass.test_call_or_write_node ||= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def PrismTestSubclass.test_call_or_write_node
          "str"
        end
        PrismTestSubclass.test_call_or_write_node ||= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def self.test_call_or_write_node; end;
        def self.test_call_or_write_node=(val)
          val
        end
        self.test_call_or_write_node ||= 1
      CODE
      )

      assert_prism_eval(<<-CODE
        def self.test_call_or_write_node
          "str"
        end
        self.test_call_or_write_node ||= 1
      CODE
      )

      assert_prism_eval(<<-CODE)
        def self.test_prism_call_node
          2
        end
        def self.test_prism_call_node=(val)
          val
        end
        self&.test_prism_call_node ||= 1
      CODE

      assert_prism_eval(<<-CODE)
        def self.test_prism_call_node; end
        def self.test_prism_call_node=(val)
          val
        end
        self&.test_prism_call_node ||= 1
      CODE
    end

    def test_CallOperatorWriteNode
      assert_prism_eval(<<-CODE
        class PrismTestSubclass; end
        def PrismTestSubclass.test_call_operator_write_node
          2
        end
        def PrismTestSubclass.test_call_operator_write_node=(val)
          val
        end
        PrismTestSubclass.test_call_operator_write_node += 1
      CODE
      )
    end

    def test_ForwardingArgumentsNode
      assert_prism_eval(<<-CODE)
        def prism_test_forwarding_arguments_node(...); end;
        def prism_test_forwarding_arguments_node1(...)
          prism_test_forwarding_arguments_node(...)
        end
      CODE

      assert_prism_eval(<<-CODE)
        def prism_test_forwarding_arguments_node(...); end;
        def prism_test_forwarding_arguments_node1(a, ...)
          prism_test_forwarding_arguments_node(1,2, 3, ...)
        end
      CODE

      assert_prism_eval(<<~RUBY)
        o = Object.new
        def o.bar(a, b, c) = [a, b, c]
        def o.foo(...) = 1.times { bar(...) }

        o.foo(1, 2, 3)
      RUBY
    end

    def test_ForwardingArgumentsNode_instruction_sequence_consistency
      # Test that both parsers generate identical instruction sequences for forwarding arguments
      # This prevents regressions like the one fixed in prism_compile.c for PM_FORWARDING_ARGUMENTS_NODE

      # Test case from the bug report: def bar(buz, ...) = foo(buz, ...)
      source = <<~RUBY
        def foo(*, &block) = block
        def bar(buz, ...) = foo(buz, ...)
      RUBY

      compare_instruction_sequences(source)

      # Test simple forwarding
      source = <<~RUBY
        def target(...) = nil
        def forwarder(...) = target(...)
      RUBY

      compare_instruction_sequences(source)

      # Test mixed forwarding with regular arguments
      source = <<~RUBY
        def target(a, b, c) = [a, b, c]
        def forwarder(x, ...) = target(x, ...)
      RUBY

      compare_instruction_sequences(source)

      # Test forwarding with splat
      source = <<~RUBY
        def target(a, b, c) = [a, b, c]
        def forwarder(x, ...); target(*x, ...); end
      RUBY

      compare_instruction_sequences(source)
    end

    private

    def compare_instruction_sequences(source)
      # Get instruction sequences from both parsers
      parsey_iseq = RubyVM::InstructionSequence.compile_parsey(source)
      prism_iseq = RubyVM::InstructionSequence.compile_prism(source)

      # Compare instruction sequences
      assert_equal parsey_iseq.disasm, prism_iseq.disasm
    end

    public

    def test_ForwardingSuperNode
      assert_prism_eval("class Forwarding; def to_s; super; end; end")
      assert_prism_eval("class Forwarding; def eval(code); super { code }; end; end")
      assert_prism_eval(<<-CODE)
        class A
          def initialize(a, b)
          end
        end

        class B < A
          attr_reader :res
          def initialize(a, b, *)
            super
            @res = [a, b]
          end
        end

        B.new(1, 2).res
      CODE
    end

    def test_KeywordHashNode
      assert_prism_eval("[a: [:b, :c]]")
    end

    def test_SuperNode
      assert_prism_eval("def to_s; super 1; end")
      assert_prism_eval("def to_s; super(); end")
      assert_prism_eval("def to_s; super('a', :b, [1,2,3]); end")
      assert_prism_eval("def to_s; super(1, 2, 3, &:foo); end")
    end

    ############################################################################
    # Methods / parameters                                                     #
    ############################################################################

    def test_AliasGlobalVariableNode
      assert_prism_eval("alias $prism_foo $prism_bar")
    end

    def test_AliasMethodNode
      assert_prism_eval("alias :prism_a :to_s")
    end

    def test_BlockParameterNode
      assert_prism_eval("def prism_test_block_parameter_node(&bar) end")
      assert_prism_eval("->(b, c=1, *d, e, &f){}")

      # Test BlockParameterNode with no name
      assert_prism_eval("->(&){}")
      assert_prism_eval("def prism_test_block_parameter_node(&); end")
    end

    def test_BlockParametersNode
      assert_prism_eval("Object.tap { || }")
      assert_prism_eval("[1].map { |num| num }")
      assert_prism_eval("[1].map { |a; b| b = 2; a + b}")

      # Test block parameters with multiple _
      assert_prism_eval(<<~RUBY)
        [[1, 2, 3, 4, 5, 6]].map { |(_, _, _, _, _, _)| _ }
      RUBY
    end

    def test_FowardingParameterNode
      assert_prism_eval("def prism_test_forwarding_parameter_node(...); end")
    end

    def test_KeywordRestParameterNode
      assert_prism_eval("def prism_test_keyword_rest_parameter_node(a, **b); end")
      assert_prism_eval("Object.tap { |**| }")

      # Test that KeywordRestParameterNode creates a copy
      assert_prism_eval(<<~RUBY)
        hash = {}
        o = Object.new
        def o.foo(**a) = a[:foo] = 1

        o.foo(**hash)
        hash
      RUBY
    end

    def test_NoKeywordsParameterNode
      assert_prism_eval("def prism_test_no_keywords(**nil); end")
      assert_prism_eval("def prism_test_no_keywords(a, b = 2, **nil); end")
    end

    def test_OptionalParameterNode
      assert_prism_eval("def prism_test_optional_param_node(bar = nil); end")
    end

    def test_OptionalKeywordParameterNode
      assert_prism_eval("def prism_test_optional_keyword_param_node(bar: nil); end")

      # Test with optional argument and method call in OptionalKeywordParameterNode
      assert_prism_eval(<<~RUBY)
        o = Object.new
        def o.foo = 1
        def o.bar(a = nil, b: foo) = b
        o.bar
      RUBY
    end

    def test_ParametersNode
      assert_prism_eval("def prism_test_parameters_node(bar, baz); end")
      assert_prism_eval("def prism_test_parameters_node(a, b = 2); end")
    end

    def test_RequiredParameterNode
      assert_prism_eval("def prism_test_required_param_node(bar); end")
      assert_prism_eval("def prism_test_required_param_node(foo, bar); end")
    end

    def test_RequiredKeywordParameterNode
      assert_prism_eval("def prism_test_required_param_node(bar:); end")
      assert_prism_eval("def prism_test_required_param_node(foo:, bar:); end")
      assert_prism_eval("-> a, b = 1, c:, d:, &e { a }")
    end

    def test_RestParameterNode
      assert_prism_eval("def prism_test_rest_parameter_node(*a); end")
    end

    def test_UndefNode
      assert_prism_eval("def prism_undef_node_1; end; undef prism_undef_node_1")
      assert_prism_eval(<<-HERE
        def prism_undef_node_2
        end
        def prism_undef_node_3
        end
        undef prism_undef_node_2, prism_undef_node_3
      HERE
      )
      assert_prism_eval(<<-HERE
        def prism_undef_node_4
        end
        undef :'prism_undef_node_#{4}'
      HERE
      )
    end

    ############################################################################
    # Pattern matching                                                         #
    ############################################################################

    def test_AlternationPatternNode
      assert_prism_eval("1 in 1 | 2")
      assert_prism_eval("1 in 2 | 1")
      assert_prism_eval("1 in 2 | 3 | 4 | 1")
      assert_prism_eval("1 in 2 | 3")
    end

    def test_ArrayPatternNode
      assert_prism_eval("[] => []")

      ["in", "=>"].each do |operator|
        ["", "Array"].each do |constant|
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, 2, 3]")

          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, *]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, 2, *]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, 2, 3, *]")

          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*foo]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, *foo]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, 2, *foo]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[1, 2, 3, *foo]")

          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*, 3]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*, 2, 3]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*, 1, 2, 3]")

          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*foo, 3]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*foo, 2, 3]")
          assert_prism_eval("[1, 2, 3] #{operator} #{constant}[*foo, 1, 2, 3]")
        end
      end

      assert_prism_eval("begin; Object.new => [1, 2, 3]; rescue NoMatchingPatternError; true; end")
      assert_prism_eval("begin; [1, 2, 3] => Object[1, 2, 3]; rescue NoMatchingPatternError; true; end")
    end

    def test_CapturePatternNode
      assert_prism_eval("[1] => [Integer => foo]")
    end

    def test_CaseMatchNode
      assert_prism_eval(<<~RUBY)
        case [1, 2, 3]
        in [1, 2, 3]
          4
        end
      RUBY

      assert_prism_eval(<<~RUBY)
        case { a: 5, b: 6 }
        in [1, 2, 3]
          4
        in { a: 5, b: 6 }
          7
        end
      RUBY

      assert_prism_eval(<<~RUBY)
        case [1, 2, 3, 4]
        in [1, 2, 3]
          4
        in { a: 5, b: 6 }
          7
        else
        end
      RUBY

      assert_prism_eval(<<~RUBY)
        case [1, 2, 3, 4]
        in [1, 2, 3]
          4
        in { a: 5, b: 6 }
          7
        else
          8
        end
      RUBY

      assert_prism_eval(<<~RUBY)
        case [1, 2, 3]
        in [1, 2, 3] unless to_s
        in [1, 2, 3] if to_s.nil?
        in [1, 2, 3]
          true
        end
      RUBY
    end

    def test_FindPatternNode
      ["in", "=>"].each do |operator|
        ["", "Array"].each do |constant|
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, 2, 3, 4, 5, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 5, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, 2, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 2, 3, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, 4, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 4, 5, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, 2, 3, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 2, 3, 4, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, 4, 5, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, 2, 3, 4, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 2, 3, 4, 5, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, 4, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, 4, 5, *]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 1, 2, 3, 4, *]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, *foo]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, 4, *foo]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 3, 4, 5, *foo]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*, 1, 2, 3, 4, *foo]")

          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, *bar]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, 4, *bar]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 3, 4, 5, *bar]")
          assert_prism_eval("[1, 2, 3, 4, 5] #{operator} #{constant}[*foo, 1, 2, 3, 4, *bar]")
        end
      end

      assert_prism_eval("[1, [2, [3, [4, [5]]]]] => [*, [*, [*, [*, [*]]]]]")
      assert_prism_eval("[1, [2, [3, [4, [5]]]]] => [1, [2, [3, [4, [5]]]]]")

      assert_prism_eval("begin; Object.new => [*, 2, *]; rescue NoMatchingPatternError; true; end")
      assert_prism_eval("begin; [1, 2, 3] => Object[*, 2, *]; rescue NoMatchingPatternError; true; end")
    end

    def test_HashPatternNode
      assert_prism_eval("{} => {}")

      [["{ ", " }"], ["Hash[", "]"]].each do |(prefix, suffix)|
        assert_prism_eval("{} => #{prefix} **nil #{suffix}")

        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1 #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2 #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} b: 2, c: 3 #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, c: 3 #{suffix}")

        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} ** #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, ** #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, ** #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} b: 2, c: 3, ** #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, c: 3, ** #{suffix}")

        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} **foo #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, **foo #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, **foo #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} b: 2, c: 3, **foo #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, c: 3, **foo #{suffix}")

        assert_prism_eval("{ a: 1 } => #{prefix} a: 1, **nil #{suffix}")
        assert_prism_eval("{ a: 1, b: 2, c: 3 } => #{prefix} a: 1, b: 2, c: 3, **nil #{suffix}")
      end

      assert_prism_eval("{ a: { b: { c: 1 } } } => { a: { b: { c: 1 } } }")
    end

    def test_MatchPredicateNode
      assert_prism_eval("1 in 1")
      assert_prism_eval("1.0 in 1.0")
      assert_prism_eval("1i in 1i")
      assert_prism_eval("1r in 1r")

      assert_prism_eval("\"foo\" in \"foo\"")
      assert_prism_eval("\"foo \#{1}\" in \"foo \#{1}\"")

      assert_prism_eval("false in false")
      assert_prism_eval("nil in nil")
      assert_prism_eval("self in self")
      assert_prism_eval("true in true")

      assert_prism_eval("5 in 0..10")
      assert_prism_eval("5 in 0...10")

      assert_prism_eval("[\"5\"] in %w[5]")

      assert_prism_eval("Prism in Prism")
      assert_prism_eval("Prism in ::Prism")

      assert_prism_eval(":prism in :prism")
      assert_prism_eval("%s[prism\#{1}] in %s[prism\#{1}]")
      assert_prism_eval("\"foo\" in /.../")
      assert_prism_eval("\"foo1\" in /...\#{1}/")
      assert_prism_eval("4 in ->(v) { v.even? }")

      assert_prism_eval("5 in foo")

      assert_prism_eval("1 in 2")

      # Bug: https://bugs.ruby-lang.org/issues/20956
      assert_prism_eval("1 in [1 | [1]]")
    end

    def test_MatchRequiredNode
      assert_prism_eval("1 => 1")
      assert_prism_eval("1.0 => 1.0")
      assert_prism_eval("1i => 1i")
      assert_prism_eval("1r => 1r")

      assert_prism_eval("\"foo\" => \"foo\"")
      assert_prism_eval("\"foo \#{1}\" => \"foo \#{1}\"")

      assert_prism_eval("false => false")
      assert_prism_eval("nil => nil")
      assert_prism_eval("true => true")

      assert_prism_eval("5 => 0..10")
      assert_prism_eval("5 => 0...10")

      assert_prism_eval("[\"5\"] => %w[5]")

      assert_prism_eval(":prism => :prism")
      assert_prism_eval("%s[prism\#{1}] => %s[prism\#{1}]")
      assert_prism_eval("\"foo\" => /.../")
      assert_prism_eval("\"foo1\" => /...\#{1}/")
      assert_prism_eval("4 => ->(v) { v.even? }")

      assert_prism_eval("5 => foo")
    end

    def test_PinnedExpressionNode
      assert_prism_eval("4 in ^(4)")
    end

    def test_PinnedVariableNode
      assert_prism_eval("module Prism; @@prism = 1; 1 in ^@@prism; end")
      assert_prism_eval("module Prism; @prism = 1; 1 in ^@prism; end")
      assert_prism_eval("$prism = 1; 1 in ^$prism")
      assert_prism_eval("prism = 1; 1 in ^prism")
      assert_prism_eval("[1].each { 1 => ^it }")
    end

    ############################################################################
    #  Miscellaneous                                                           #
    ############################################################################

    def test_eval
      assert_prism_eval("eval('1 + 1')", raw: true)
      assert_prism_eval("a = 1; eval('a + 1')", raw: true)

      assert_prism_eval(<<~CODE, raw: true)
        def prism_eval_splat(**bar)
          eval("bar")
        end
        prism_eval_splat(bar: 10)
      CODE

      assert_prism_eval(<<~CODE, raw: true)
        def prism_eval_keywords(baz:)
          eval("baz")
        end
        prism_eval_keywords(baz: 10)
      CODE

      assert_prism_eval(<<~CODE, raw: true)
        [1].each do |a|
          [2].each do |b|
            c = 3
            eval("a + b + c")
          end
        end
      CODE

      assert_prism_eval(<<~CODE, raw: true)
        def prism_eval_binding(b)
          eval("bar", b)
        end

        bar = :ok
        prism_eval_binding(binding)
      CODE
    end

    def test_ScopeNode
      assert_separately(%w[], <<~'RUBY')
        def compare_eval(source)
          ruby_eval = RubyVM::InstructionSequence.compile("module A; " + source + "; end").eval
          prism_eval = RubyVM::InstructionSequence.compile_prism("module B; " + source + "; end").eval

          assert_equal ruby_eval, prism_eval
        end

        def assert_prism_eval(source)
          $VERBOSE, verbose_bak = nil, $VERBOSE

          begin
            compare_eval(source)

            # Test "popped" functionality
            compare_eval("#{source}; 1")
          ensure
            $VERBOSE = verbose_bak
          end
        end

        assert_prism_eval("a = 1; 1.times do; { a: }; end")
        assert_prism_eval("a = 1; def foo(a); a; end")
      RUBY
    end

    ############################################################################
    # Errors                                                                   #
    ############################################################################

    def test_MissingNode
      # TODO
    end

    ############################################################################
    #  Encoding                                                                #
    ############################################################################

    def test_encoding
      assert_prism_eval('"però"')
      assert_prism_eval(":però")
    end

    def test_parse_file
      assert_nothing_raised do
        RubyVM::InstructionSequence.compile_file_prism(__FILE__)
      end

      error = assert_raise Errno::ENOENT do
        RubyVM::InstructionSequence.compile_file_prism("idontexist.rb")
      end

      assert_equal "No such file or directory - idontexist.rb", error.message

      assert_raise TypeError do
        RubyVM::InstructionSequence.compile_file_prism(nil)
      end
    end

    private

    def compare_eval(source, raw:, location:)
      source = raw ? source : "class Prism::TestCompilePrism\n#{source}\nend"

      ruby_eval = RubyVM::InstructionSequence.compile_parsey(source).eval
      prism_eval = RubyVM::InstructionSequence.compile_prism(source).eval

      if ruby_eval.is_a? Proc
        assert_equal ruby_eval.class, prism_eval.class, "@#{location.path}:#{location.lineno}"
      else
        assert_equal ruby_eval, prism_eval, "@#{location.path}:#{location.lineno}"
      end
    end

    def assert_prism_eval(source, raw: false)
      location = caller_locations(1, 1).first
      $VERBOSE, verbose_bak = nil, $VERBOSE

      begin
        compare_eval(source, raw:, location:)

        # Test "popped" functionality
        compare_eval("#{source}; 1", raw:, location:)
      ensure
        $VERBOSE = verbose_bak
      end
    end
  end