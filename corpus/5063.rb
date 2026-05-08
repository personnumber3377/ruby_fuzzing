do |f|
      {#
        s = +""
        ARGF.each_char {|c| s << c }
        puts s
      };
      assert_equal("1\n2\n3\n4\n5\n6\n", f.read)
    end