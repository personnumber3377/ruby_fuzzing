do |f|
      {#
        ARGF.each_byte {|l| print l; ARGF.skip}
      };
      assert_equal("135".unpack("C*").join(""), f.read, '[ruby-list:49185]')
    end