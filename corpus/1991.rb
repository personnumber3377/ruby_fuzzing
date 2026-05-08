do
      i = d.pos
      break unless x = d.read
      d.pos = i
      assert_equal(x, d.read)
    end