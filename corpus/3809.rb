def o.bug7942 a: 1; a; end", nil, __FILE__, __LINE__)
    assert_equal(1, o.bug7942(), bug7942)
    assert_equal(42, o.bug7942(a: 42), bug7942)

    o = Object.new
    eval("def o.bug7942 a: 1, **; a; end", nil, __FILE__, __LINE__)
    assert_equal(1, o.bug7942(), bug7942)
    assert_equal(42, o.bug7942(a: 42), bug7942)
  end

  def test_required_keyword
    feature7701 = '[ruby-core:51454] [Feature #7701] required keyword argument'
    o = Object.new
    assert_nothing_raised(SyntaxError, feature7701) do
      eval("def o.foo(a:) a; end", nil, "xyzzy