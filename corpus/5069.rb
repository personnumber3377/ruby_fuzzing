do |f|
      {#
        ARGF.skip
        puts ARGF.gets
        ARGF.skip
        puts ARGF.read
      };
      assert_equal("1\n3\n4\n5\n6\n", f.read)
    end