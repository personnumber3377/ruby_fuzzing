do |f|
      f.binmode
      assert_equal("1\n2\n3\n4\n5\r\n6\r\n", f.read, bug5268)
    end