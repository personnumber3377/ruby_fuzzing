do |r,w|
      assert_equal(true, r.freeze.autoclose?)
    end