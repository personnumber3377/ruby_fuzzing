do |f|
      {#
        ARGF.each_codepoint {|l| printf "%x:", l; ARGF.skip}
      };
      assert_equal("3042:3044:3046:", f.read, '[ruby-list:49185]')
    end