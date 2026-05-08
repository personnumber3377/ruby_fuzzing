do |i|
      assert_equal(291.4, f.floor(i+1), bug17183)
      assert_equal(291.4, f.ceil(i+1), bug17183)
    end