do |a, en|
      e = Encoding.find(a)
      assert_equal(e.name, en)
      assert_include(e.names, a)
    end