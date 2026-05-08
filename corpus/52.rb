do |enc|
      next unless enc.ascii_compatible?
      s = S("a:".force_encoding(enc))
      assert_equal([enc]*2, s.split(":", 2).map(&:encoding), bug6206)
    end