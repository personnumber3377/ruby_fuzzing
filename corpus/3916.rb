downcase
      r = enccall(r, :sub, /\A[a-z]/) {|ch| b(ch).upcase }
      assert_equal(r, t1)
    }
  end