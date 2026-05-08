do
      str = "\xff".force_encoding('utf-8')
      assert_equal str, str.encode, bug8995
      assert_equal "\ufffd", str.encode(invalid: :replace), bug8995
    end