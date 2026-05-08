do |e|
      assert_equal(e, Encoding.find(e.name))
      assert_equal(e, Encoding.find(e.name.upcase))
      assert_equal(e, Encoding.find(e.name.capitalize))
      assert_equal(e, Encoding.find(e.name.downcase))
      assert_equal(e, Encoding.find(e))
    end