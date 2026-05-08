do |f|
      {#
        s = +"0123456789"
        ARGF.read(8, s)
        p s
      };
      assert_equal("\"1\\n2\\n3\\n4\\n\"\n", f.read)
    end