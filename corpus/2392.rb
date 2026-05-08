do |r, e|
      longer = r[1..-1].select {|x| x.size > 80}
      assert_equal([], longer)
      assert_equal([], e)
    end