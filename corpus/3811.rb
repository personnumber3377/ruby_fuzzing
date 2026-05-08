proc {|a:| a}", nil, 'xyzzy', __LINE__)
    end
    assert_raise_with_message(ArgumentError, /missing keyword/, feature7701) {b.call}
    e = assert_raise_with_message(ArgumentError, /unknown keyword/, feature7701) {b.call(a:0, b:1)}
    assert_equal('xyzzy', e.backtrace_locations[0].path)

    assert_equal(42, b.call(a: 42), feature7701)
    assert_equal([[:keyreq, :a]], b.parameters, feature7701)

    bug8139 = '[ruby-core:53608] [Bug #8139] required keyword argument with rest hash'
    b = assert_nothing_raised(SyntaxError, feature7701) do
      break eval("proc {|a:, **bl| [a, bl]}", nil, __FILE__, __LINE__)
    end
    assert_equal([42, {}], b.call(a: 42), feature7701)
    assert_equal([42, {c: feature7701}], b.call(a: 42, c: feature7701), feature7701)
    assert_equal([[:keyreq, :a], [:keyrest, :bl]], b.parameters, feature7701)
    assert_raise_with_message(ArgumentError, /missing keyword/, bug8139) {b.call(c: bug8139)}
    assert_raise_with_message(ArgumentError, /missing keyword/, bug8139) {b.call}

    b = assert_nothing_raised(SyntaxError, feature7701) do
      break eval("proc {|m, a:| [m, a]}", nil, 'xyzzy', __LINE__)
    end
    assert_raise_with_message(ArgumentError, /missing keyword/) {b.call}
    assert_equal([:ok, 42], b.call(:ok, a: 42))
    e = assert_raise_with_message(ArgumentError, /unknown keyword/) {b.call(42, a:0, b:1)}
    assert_equal('xyzzy', e.backtrace_locations[0].path)
    assert_equal([[:opt, :m], [:keyreq, :a]], b.parameters)
  end

  def test_super_with_keyword
    bug8236 = '[ruby-core:54094] [Bug #8236]'
    base = Class.new do
      def foo(*args)
        args
      end
    end
    a = Class.new(base) do
      def foo(arg, bar: 'x')
        super
      end
    end
    b = Class.new(base) do
      def foo(*args, bar: 'x')
        super
      end
    end
    assert_equal([42, {:bar=>"x"}], a.new.foo(42), bug8236)
    assert_equal([42, {:bar=>"x"}], b.new.foo(42), bug8236)
  end

  def test_super_with_keyword_kwrest
    base = Class.new do
      def foo(**h)
        h
      end
    end
    a = Class.new(base) do
      attr_reader :h
      def foo(a:, b:, **h)
        @h = h
        super
      end
    end

    o = a.new
    assert_equal({a: 1, b: 2, c: 3}, o.foo(a: 1, b: 2, c: 3))
    assert_equal({c: 3}, o.h)
  end

  def test_zsuper_only_named_kwrest
    bug8416 = '[ruby-core:55033] [Bug #8416]'
    base = Class.new do
      def foo(**h)
        h
      end
    end
    a = Class.new(base) do
      attr_reader :h
      def foo(**h)
        @h = h
        super
      end
    end
    o = a.new
    assert_equal({:bar=>"x"}, o.foo(bar: "x