do |enc|
      e = Dir.foreach(newdir, encoding: enc)
      assert_equal(enc, e.to_a.first.encoding)
    end