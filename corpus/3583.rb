        class PrismClassA; end
        class PrismClassA::PrismClassC; end
        class PrismClassB; end
        class PrismClassB::PrismClassD < PrismClassA::PrismClassC; end
      HERE
      )
    end

    # Many of these tests are versions of tests at bootstraptest/test_method.rb
    def test_DefNode
      assert_prism_eval("def prism_test_def_node; end")
      assert_prism_eval("a = Object.new; def a.prism_singleton; :ok; end; a.prism_singleton")
      assert_prism_eval("def self.prism_test_def_node() 1 end; prism_test_def_node()")
      assert_prism_eval("def self.prism_test_def_node(a,b) [a, b] end; prism_test_def_node(1,2)")
      assert_prism_eval("def self.prism_test_def_node(a,x=7,y=1) x end; prism_test_def_node(7,1)")
      assert_prism_eval("def self.prism_test_def_node(a = 1); x = 2; end; prism_test_def_node")

      # rest argument
      assert_prism_eval("def self.prism_test_def_node(*a) a end; prism_test_def_node().inspect")
      assert_prism_eval("def self.prism_test_def_node(*a) a end; prism_test_def_node(1).inspect")
      assert_prism_eval("def self.prism_test_def_node(x,y,*a) a end; prism_test_def_node(7,7,1,2).inspect")
      assert_prism_eval("def self.prism_test_def_node(x,y=7,*a) a end; prism_test_def_node(7).inspect")
      assert_prism_eval("def self.prism_test_def_node(x,y,z=7,*a) a end; prism_test_def_node(7,7).inspect")
      assert_prism_eval("def self.prism_test_def_node(x,y,z=7,zz=7,*a) a end; prism_test_def_node(7,7,7).inspect")

      # keyword arguments
      assert_prism_eval("def self.prism_test_def_node(a: 1, b: 2, c: 4) a + b + c; end; prism_test_def_node(a: 2)")
      assert_prism_eval("def self.prism_test_def_node(a: 1, b: 2, c: 4) a + b + c; end; prism_test_def_node(b: 3)")
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(x = 1, y, a: 8, b: 2, c: 4)
          a + b + c + x + y
        end
        prism_test_def_node(10, b: 3)
      CODE
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a: [])
          a
        end
        prism_test_def_node
      CODE

      # block arguments
      assert_prism_eval("def self.prism_test_def_node(&block) block end; prism_test_def_node{}.class")
      assert_prism_eval("def self.prism_test_def_node(&block) block end; prism_test_def_node().inspect")
      assert_prism_eval("def self.prism_test_def_node(a,b=7,*c,&block) b end; prism_test_def_node(7,1).inspect")
      assert_prism_eval("def self.prism_test_def_node(a,b=7,*c,&block) c end; prism_test_def_node(7,7,1).inspect")

      # splat
      assert_prism_eval("def self.prism_test_def_node(a) a end; prism_test_def_node(*[1])")
      assert_prism_eval("def self.prism_test_def_node(x,a) a end; prism_test_def_node(7,*[1])")
      assert_prism_eval("def self.prism_test_def_node(x,y,a) a end; prism_test_def_node(7,7,*[1])")
      assert_prism_eval("def self.prism_test_def_node(x,y,a,b,c) a end; prism_test_def_node(7,7,*[1,7,7])")

      # recursive call
      assert_prism_eval("def self.prism_test_def_node(n) n == 0 ? 1 : prism_test_def_node(n-1) end; prism_test_def_node(5)")

      # instance method
      assert_prism_eval("class PrismTestDefNode; def prism_test_def_node() 1 end end;  PrismTestDefNode.new.prism_test_def_node")
      assert_prism_eval("class PrismTestDefNode; def prism_test_def_node(*a) a end end;  PrismTestDefNode.new.prism_test_def_node(1).inspect")

      # block argument
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(&block) prism_test_def_node2(&block) end
        def self.prism_test_def_node2() yield 1 end
        prism_test_def_node2 {|a| a }
      CODE

      # multi argument
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a, (b, *c, d))
          [a, b, c, d]
        end
        prism_test_def_node("a", ["b", "c", "d"])
      CODE
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a, (b, c, *))
          [a, b, c]
        end
        prism_test_def_node("a", ["b", "c"])
      CODE
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a, (*, b, c))
          [a, b, c]
        end
        prism_test_def_node("a", ["b", "c"])
      CODE

      # recursive multis
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a, (b, *c, (d, *e, f)))
          [a, b, c, d, d, e, f]
        end
        prism_test_def_node("a", ["b", "c", ["d", "e", "f"]])
      CODE

      # Many arguments
      assert_prism_eval(<<-CODE)
        def self.prism_test_def_node(a, (b, *c, d), e = 1, *f, g, (h, *i, j),  k:, l: 1, **m)
          [a, b, c, d, e, f, g, h, i, j, k, l, m]
        end
        prism_test_def_node(
          "a",
          ["b", "c1", "c2", "d"],
          "e",
          "f1", "f2",
          "g",
          ["h", "i1", "i2", "j"],
          k: "k",
          l: "l",
          m1: "m1",
          m2: "m2"
        )
      CODE
    end

    def test_pow_parameters
      assert_prism_eval("def self.m(a, **); end; method(:m).parameters")
    end

    def test_star_parameters
      assert_prism_eval("def self.m(a, *, b); end; method(:m).parameters")
    end

    def test_repeated_block_params
      assert_prism_eval("def self.x(&blk); blk; end; x { |_, _, _ = 1, *_, _:, _: 2, **_, &_| }.parameters")
    end

    def test_repeated_proc_params
      assert_prism_eval("proc {|_, _, _ = 1, *_, _:, _: 2, **_, &_| }.parameters")
    end

    def test_forward_parameters_block
      assert_prism_eval("def self.m(&); end; method(:m).parameters")
    end

    def test_forward_parameters
      assert_prism_eval("def self.m(...); end; method(:m).parameters")
    end

    def test_repeated_block_underscore
      assert_prism_eval("def self.m(_, **_, &_); _; end; method(:m).parameters")
    end

    def test_repeated_kw_rest_underscore
      assert_prism_eval("def self.m(_, **_); _; end; method(:m).parameters")
    end

    def test_repeated_required_keyword_underscore
      assert_prism_eval("def self.m(_, _, *_, _, _:); _; end; method(:m).parameters")
      assert_prism_eval("def self.m(_, _, *_, _, _:, _: 2); _; end; method(:m).parameters")
    end

    def test_repeated_required_post_underscore
      assert_prism_eval("def self.m(_, _, *_, _); _; end; method(:m).parameters")
    end

    def test_repeated_splat_underscore
      assert_prism_eval("def self.m(_, _, _ = 1, _ = 2, *_); end; method(:m).parameters")
    end

    def test_repeated_optional_underscore
      assert_prism_eval("def self.m(a, _, _, _ = 1, _ = 2, b); end; method(:m).parameters")
    end

    def test_repeated_required_underscore
      assert_prism_eval("def self.m(a, _, _, b); end; method(:m).parameters")
    end

    def test_locals_in_parameters
      assert_prism_eval("def self.m(a = b = c = 1); [a, b, c]; end; self.m")
    end

    def test_trailing_comma_on_block
      assert_prism_eval("def self.m; yield [:ok]; end; m {|v0,| v0 }")
    end

    def test_complex_default_params
      assert_prism_eval("def self.foo(a:, b: '2'.to_i); [a, b]; end; foo(a: 1)")
      assert_prism_eval("def self.foo(a:, b: 2, c: '3'.to_i); [a, b, c]; end; foo(a: 1)")
    end

    def test_numbered_params
      assert_prism_eval("[1, 2, 3].then { _3 }")
      assert_prism_eval("1.then { one = 1; one + _1 }")
    end

    def test_rescue_with_ensure
      assert_prism_eval(<<-CODE)