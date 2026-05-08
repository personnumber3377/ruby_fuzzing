do |enc|
      (0..256).map do |c|
        begin
          s = c.chr(enc)
        rescue RangeError, ArgumentError
          break
        else
          assert_not_match(/\0/, s.dump, bug3996)
        end