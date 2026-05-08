do |f|
      {#
        s = +""
        ARGF.read(8, s)
        p s
      };
      assert_equal("\"1\\n2\\n3\\n4\\n\"\n", f.read)
    end