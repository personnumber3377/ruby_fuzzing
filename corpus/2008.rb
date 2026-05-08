do |enc|
      assert_equal(enc, Dir.entries(@root, encoding: enc).first.encoding)
    end