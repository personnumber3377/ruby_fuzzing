do |f|
      {#
        ARGF.each_char {|l| print l; ARGF.skip}
      };
      assert_equal("\u{3042 3044 3046}", f.read, '[ruby-list:49185]')
    end