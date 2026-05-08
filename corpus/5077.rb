do |f|
      {#
        ARGF.close
        puts ARGF.read
      };
      assert_equal("3\n4\n5\n6\n", f.read)
    end