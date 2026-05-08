do |f|
      {#
        ARGF.each_line {|l| ARGF.skip; puts [l, ARGF.gets].map {|s| s ? s.chomp : s.inspect}.join("+")}
      };
      assert_equal("1+3\n4+5\n6+nil\n", f.read, '[ruby-list:49185]')
    end