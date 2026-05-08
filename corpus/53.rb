do |enc|
      s = S("abc,def".encode(enc))
      assert_equal(["abc", "def"].map {|c| c.encode(enc)},
                   s.split(",".encode(enc)),
                   "#{bug8642} in #{enc.name}")
    end