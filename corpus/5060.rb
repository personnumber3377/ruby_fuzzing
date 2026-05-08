do |f|
      {#
        s = []
        ARGF.each_line {|l| s << l }
        p s
      };
      assert_equal("[\"1\\n\", \"2\\n\", \"3\\n\", \"4\\n\", \"5\\n\", \"6\\n\"]\n", f.read)
    end