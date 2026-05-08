do |f|
      {#
        ARGF.each_line {|l| print l; ARGF.skip}
      };
      assert_equal("1\n3\n5\n", f.read, '[ruby-list:49185]')
    end