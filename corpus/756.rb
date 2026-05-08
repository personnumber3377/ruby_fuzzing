def foo a, ...\n bar(a, ...)\n"" end", __FILE__, __LINE__)
    assert_equal [[4], {}], obj.foo(4)
    assert_equal [[4, 2], {}], obj.foo(4, 2)
    assert_equal [[4, 2, 3], {}], obj.foo(4, 2, 3)
    assert_equal [[4], {a: 1}], obj.foo(4, a: 1)
    assert_equal [[4, 2], {a: 1}], obj.foo(4, 2, a: 1)
    assert_equal [[4, 2, 3], {a: 1}], obj.foo(4, 2, 3, a: 1)
    assert_equal [[4, 2, 3], {a: 1}], obj.foo(4, 2, 3, a: 1){|args, kws| [args, kws]}

    obj.singleton_class.send(:remove_method, :foo)
    obj.instance_eval("def foo a, ...; bar(a, ...); end", __FILE__, __LINE__)
    assert_equal [[4], {}], obj.foo(4)
    assert_equal [[4, 2], {}], obj.foo(4, 2)
    assert_equal [[4, 2, 3], {}], obj.foo(4, 2, 3)
    assert_equal [[4], {a: 1}], obj.foo(4, a: 1)
    assert_equal [[4, 2], {a: 1}], obj.foo(4, 2, a: 1)
    assert_equal [[4, 2, 3], {a: 1}], obj.foo(4, 2, 3, a: 1)
    assert_equal [[4, 2, 3], {a: 1}], obj.foo(4, 2, 3, a: 1){|args, kws| [args, kws]}

    exp = eval("-> (a: nil) {a...1}