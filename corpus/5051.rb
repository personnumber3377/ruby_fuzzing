do |f|
      {#
        nil while ARGF.gets
        p ARGF.read
        p ARGF.read(0, +"")
      };
      assert_equal("nil\n\"\"\n", f.read)
    end