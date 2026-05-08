do |r, e|
      assert_file.identical?(r.join(''), d)
      assert_equal([], e)
    end