do
      i = S("abc\"\\".force_encoding("utf-8")).inspect

      assert_equal('"abc\\"\\\\"', i, bug4081)
    end