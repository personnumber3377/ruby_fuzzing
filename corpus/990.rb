do |k, v|
      assert_equal(v, h.delete(k))
    end