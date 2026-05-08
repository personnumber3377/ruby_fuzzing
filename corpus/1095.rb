      class C
        private def foo
          :C
        end
      end

      class D < C
        public :foo
      end

      class E < D; end
      class F < E; end

      test = -> do
        F.new().foo
      end

      assert_equal :C, test[]

      class E
        def foo; :E; end
      end

      assert_equal :E, test[]
    EOS
  end

  def test_module_methods_redefiniton
    m0 = Module.new do
      def foo
        super
      end
    end

    c1 = Class.new do
      def foo
        :C1
      end
    end

    c2 = Class.new do
      def foo
        :C2
      end
    end

    d1 = Class.new(c1) do
      include m0
    end

    d2 = Class.new(c2) do
      include m0
    end

    assert_equal :C1, d1.new.foo

    m = Module.new do
      def foo
        super
      end
    end

    d1.class_eval do
      include m
    end

    d2.class_eval do
      include m
    end

    assert_equal :C2, d2.new.foo
  end