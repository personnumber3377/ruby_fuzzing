a{|#{args}| [#{args}]}", __FILE__, __LINE__)
    assert_equal(OVER_STACK_ARGV + [nil], instance_eval("a{|#{args}, b| [#{args}, b]}", __FILE__, __LINE__))
    assert_equal(OVER_STACK_ARGV[0...-1], instance_eval("a{|#{args1}| [#{args1}]}", __FILE__, __LINE__))
    assert_equal(OVER_STACK_ARGV + [[]], instance_eval("a{|#{args}, *b| [#{args}, b]}", __FILE__, __LINE__))
    assert_equal(OVER_STACK_ARGV[0...-1] + [[OVER_STACK_ARGV.last]], instance_eval("a{|#{args1}, *b| [#{args1}, b]}", __FILE__, __LINE__))
    assert_equal(OVER_STACK_ARGV + [nil, []], instance_eval("a{|#{args}, b, *c| [#{args}, b, c]}", __FILE__, __LINE__))
    assert_equal(OVER_STACK_ARGV + [nil, [], nil], instance_eval("a{|#{args}, b, *c, d| [#{args}, b, c, d]}", __FILE__, __LINE__))
  end if OVER_STACK_LEN < 200

  def test_call_yield_lambda_large_array_splat_fail
    def self.a
      yield(*OVER_STACK_ARGV)
    end
    [
      ->{} ,
      ->(a=1){},
      ->(k: 1){},
      ->(**kw){},
      ->(k: 1, **kw){},
      ->(a=1, k: 1){},
      ->(a=1, **kw){},
      ->(a=1, k: 1, **kw){},
    ].each do |l|
      assert_raise_with_message(ArgumentError, /wrong number of arguments \(given #{OVER_STACK_LEN}, expected 0(\.\.[12])?\)/) do
        a(&l)
      end
    end
  end

  def test_call_yield_lambda_large_array_splat_pass
    def self.a
      yield(*OVER_STACK_ARGV)
    end

    assert_equal OVER_STACK_LEN, a(&->(*a){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(_, *a){a.length})
    assert_equal (OVER_STACK_LEN - 2), a(&->(_, *a, _){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(b=1, *a){a.length})
    assert_equal (OVER_STACK_LEN - 2), a(&->(b=1, *a, _){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(b, *a){a.length})
    assert_equal OVER_STACK_LEN, a(&->(*a, k: 1){a.length})
    assert_equal OVER_STACK_LEN, a(&->(*a, **kw){a.length})
    assert_equal OVER_STACK_LEN, a(&->(*a, k: 1, **kw){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(b=1, *a, k: 1){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(b=1, *a, **kw){a.length})
    assert_equal (OVER_STACK_LEN - 1), a(&->(b=1, *a, k: 1, **kw){a.length})
    assert_equal (OVER_STACK_LEN - 2), a(&->(b=1, *a, _, k: 1){a.length})
    assert_equal (OVER_STACK_LEN - 2), a(&->(b=1, *a, _, **kw){a.length})
    assert_equal (OVER_STACK_LEN - 2), a(&->(b=1, *a, _, k: 1, **kw){a.length})
  end

  def test_call_send_iseq_large_array_splat_fail
    def self.a; end
    def self.b(a=1); end
    def self.c(k: 1); end
    def self.d(**kw); end
    def self.e(k: 1, **kw); end
    def self.f(a=1, k: 1); end
    def self.g(a=1, **kw); end
    def self.h(a=1, k: 1, **kw); end

    (:a..:h).each do |meth|
      assert_raise_with_message(ArgumentError, /wrong number of arguments \(given #{OVER_STACK_LEN}, expected 0(\.\.[12])?\)/) do
        send(meth, *OVER_STACK_ARGV)
      end
    end
  end

  def test_call_send_iseq_large_array_splat_pass
    def self.a(*a); a.length end
    assert_equal OVER_STACK_LEN, send(:a, *OVER_STACK_ARGV)

    def self.b(_, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:b, *OVER_STACK_ARGV)

    def self.c(_, *a, _); a.length end
    assert_equal (OVER_STACK_LEN - 2), send(:c, *OVER_STACK_ARGV)

    def self.d(b=1, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:d, *OVER_STACK_ARGV)

    def self.e(b=1, *a, _); a.length end
    assert_equal (OVER_STACK_LEN - 2), send(:e, *OVER_STACK_ARGV)

    def self.f(b, *a); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:f, *OVER_STACK_ARGV)

    def self.g(*a, k: 1); a.length end
    assert_equal OVER_STACK_LEN, send(:g, *OVER_STACK_ARGV)

    def self.h(*a, **kw); a.length end
    assert_equal OVER_STACK_LEN, send(:h, *OVER_STACK_ARGV)

    def self.i(*a, k: 1, **kw); a.length end
    assert_equal OVER_STACK_LEN, send(:i, *OVER_STACK_ARGV)

    def self.j(b=1, *a, k: 1); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:j, *OVER_STACK_ARGV)

    def self.k(b=1, *a, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:k, *OVER_STACK_ARGV)

    def self.l(b=1, *a, k: 1, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 1), send(:l, *OVER_STACK_ARGV)

    def self.m(b=1, *a, _, k: 1); a.length end
    assert_equal (OVER_STACK_LEN - 2), send(:m, *OVER_STACK_ARGV)

    def self.n(b=1, *a, _, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 2), send(:n, *OVER_STACK_ARGV)

    def self.o(b=1, *a, _, k: 1, **kw); a.length end
    assert_equal (OVER_STACK_LEN - 2), send(:o, *OVER_STACK_ARGV)
  end

  def test_call_send_iseq_large_array_splat_with_large_number_of_parameters
    args = OVER_STACK_ARGV.map{|i| "a#{i}"}.join(',')
    args1 = (OVER_STACK_LEN-1).times.map{|i| "a#{i}"}.join(',')

    singleton_class.class_eval("def a(#{args}); [#{args}] end