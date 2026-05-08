do |e|
      next unless e.ascii_compatible?
      assert_equal(e, File.join(*path.map {|s| s.force_encoding(e)}).encoding, bug5483)
    end