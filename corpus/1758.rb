do |d|
      r = c / d
      assert_instance_of(Complex, r)
      assert_equal(1, r)
      assert_predicate(r.real, :integer?)
      assert_predicate(r.imag, :integer?)
    end