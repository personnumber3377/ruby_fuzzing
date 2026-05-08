do
      assert_equal("\u3042".encode, "\xA4\xA2".force_encoding('EUC-JP'))
      assert_equal("\xE3\x81\x82\x81".force_encoding("utf-8").encode,
                   "\xA4\xA2?".force_encoding('EUC-JP'))
    end