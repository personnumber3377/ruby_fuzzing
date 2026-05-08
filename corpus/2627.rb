#{meth}(*OVER_STACK_ARGV)", __FILE__, __LINE__)
      end
    end
  end

  def test_call_bmethod_large_array_splat_pass
    define_singleton_method(:a){|*a| a.length}
    assert_equal OVER_STACK_LEN, a(*OVER_STACK_ARGV)

    define_singleton_method(:b){|_, *a| a.length}
    assert_equal (OVER_STACK_LEN - 1), b(*OVER_STACK_ARGV)

    define_singleton_method(:c){|_, *a, _| a.length}
    assert_equal (OVER_STACK_LEN - 2), c(*OVER_STACK_ARGV)

    define_singleton_method(:d){|b=1, *a| a.length}
    assert_equal (OVER_STACK_LEN - 1), d(*OVER_STACK_ARGV)

    define_singleton_method(:e){|b=1, *a, _| a.length}
    assert_equal (OVER_STACK_LEN - 2), e(*OVER_STACK_ARGV)

    define_singleton_method(:f){|b, *a| a.length}
    assert_equal (OVER_STACK_LEN - 1), f(*OVER_STACK_ARGV)

    define_singleton_method(:g){|*a, k: 1| a.length}
    assert_equal OVER_STACK_LEN, g(*OVER_STACK_ARGV)

    define_singleton_method(:h){|*a, **kw| a.length}
    assert_equal OVER_STACK_LEN, h(*OVER_STACK_ARGV)

    define_singleton_method(:i){|*a, k: 1, **kw| a.length}
    assert_equal OVER_STACK_LEN, i(*OVER_STACK_ARGV)

    define_singleton_method(:j){|b=1, *a, k: 1| a.length}
    assert_equal (OVER_STACK_LEN - 1), j(*OVER_STACK_ARGV)

    define_singleton_method(:k){|b=1, *a, **kw| a.length}
    assert_equal (OVER_STACK_LEN - 1), k(*OVER_STACK_ARGV)

    define_singleton_method(:l){|b=1, *a, k: 1, **kw| a.length}
    assert_equal (OVER_STACK_LEN - 1), l(*OVER_STACK_ARGV)

    define_singleton_method(:m){|b=1, *a, _, k: 1| a.length}
    assert_equal (OVER_STACK_LEN - 2), m(*OVER_STACK_ARGV)

    define_singleton_method(:n){|b=1, *a, _, **kw| a.length}
    assert_equal (OVER_STACK_LEN - 2), n(*OVER_STACK_ARGV)

    define_singleton_method(:o){|b=1, *a, _, k: 1, **kw| a.length}
    assert_equal (OVER_STACK_LEN - 2), o(*OVER_STACK_ARGV)
  end

  def test_call_method_missing_bmethod_large_array_splat_fail
    define_singleton_method(:method_missing){|_|}
    assert_raise_with_message(ArgumentError, "wrong number of arguments (given #{OVER_STACK_LEN+1}, expected 1)