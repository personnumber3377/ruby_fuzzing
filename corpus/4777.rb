do |r, w|
      w.write '.'
      buf = String.new
      assert_raise(ArgumentError) { r.readpartial(1, buf, exception: false) }
      assert_raise(TypeError) { r.readpartial(1, exception: false) }
      assert_equal [[r],[],[]], IO.select([r], nil, nil, 1)
      assert_equal '.', r.readpartial(1)
    end