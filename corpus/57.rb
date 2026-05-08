do |enc|
      next unless enc.ascii_compatible?
      s = S("a:".force_encoding(enc))
      assert_equal([enc]*3, s.rpartition("|").map(&:encoding), bug6206)
    end