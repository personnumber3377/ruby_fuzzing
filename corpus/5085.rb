do |f|
      {#
        print Marshal.dump(ARGF.each_codepoint.to_a)
      };
      assert_equal([49, 10, 50, 10, 51, 10, 52, 10, 53, 10, 54, 10], Marshal.load(f.read))
    end