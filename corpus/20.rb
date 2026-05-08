do |e1, e2|
      assert_equal(e1.class, e2.class, message)
      if e1.is_a? Complex
        assert_equal(e1.real, e2.real, message)
        assert_equal(e1.imag, e2.imag, message)
      else
        assert_equal(e1, e2, message)
      end