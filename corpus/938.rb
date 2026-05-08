do |obj|
      assert_warning('') {
        assert_equal([[1, 2, 3], {k1: 4, k2: 5}], obj.foo(1, 2, 3, k1: 4, k2: 5) {|*x| x})
      }
      assert_warning('') {
        assert_equal([[1, 2, 3], {k1: 4, k2: 5}], obj.foo(1, 2, 3, k1: 4, k2: 5))
      }
      array = obj == obj3 ? [] : [{}]
      assert_warning('') {
        assert_equal([array, {}], obj.foo({}) {|*x| x})
      }
      assert_warning('') {
        assert_equal([array, {}], obj.foo({}))
      }
      assert_equal(-1, obj.method(:foo).arity)
      parameters = obj.method(:foo).parameters
      assert_equal(:rest, parameters.dig(0, 0))
      assert_equal(:keyrest, parameters.dig(1, 0))
      assert_equal(:block, parameters.dig(2, 0))
    end