do |enc|
      assert_equal(enc, Dir.children(@root, encoding: enc).first.encoding)
    end