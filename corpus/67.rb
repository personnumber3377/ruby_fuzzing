do |e|
      assert_equal('"abc"', S("abc".encode(e)).inspect)
      assert_equal('"\\u3042\\u3044\\u3046"', S("\u3042\u3044\u3046".encode(e)).inspect)
      assert_equal('"ab\\"c"', S("ab\"c".encode(e)).inspect, bug4081)
    end