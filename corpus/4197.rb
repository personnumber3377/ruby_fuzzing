do |type|
      conv = type.to_proc

      from = conv.(0)
      to = conv.(10)
      step = conv.(2)

      # finite
      a = []
      (from..to).step(step) {|x| a << x }
      assert_equal([0, 2, 4, 6, 8, 10].map(&conv), a)

      a = []
      (from...to).step(step) {|x| a << x }
      assert_equal([0, 2, 4, 6, 8].map(&conv), a)

      # Note: ArithmeticSequence behavior tested in its own test, but we also put it here
      # to demonstrate the result is the same
      assert_kind_of(Enumerator::ArithmeticSequence, (from..to).step(step))
      assert_equal([0, 2, 4, 6, 8, 10].map(&conv), (from..to).step(step).to_a)
      assert_kind_of(Enumerator::ArithmeticSequence, (from...to).step(step))
      assert_equal([0, 2, 4, 6, 8].map(&conv), (from...to).step(step).to_a)

      # end