do |f|
      {#
        s = []
        ARGF.each_byte {|c| s << c }
        p s
      };
      assert_equal("[49, 10, 50, 10, 51, 10, 52, 10, 53, 10, 54, 10]\n", f.read)
    end