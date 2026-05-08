do
      assert_equal(S("\u{ABCDE 10ABCD}"), S('"\\u{ABCDE 10ABCD}"').undump)
    end