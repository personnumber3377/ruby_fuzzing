do
      assert_equal("\u3042".encode, "\u3042")
      assert_equal("\xE3\x81\x82\x81".force_encoding("utf-8").encode,
                   "\xE3\x81\x82\x81".force_encoding("utf-8"))
    end