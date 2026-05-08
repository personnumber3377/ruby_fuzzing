do |enc|
      e = Dir.each_child(newdir, encoding: enc)
      assert_equal(enc, e.to_a.first.encoding)
    end