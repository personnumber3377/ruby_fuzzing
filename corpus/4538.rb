do |r|
      r.binmode
      assert_equal("\377", r.gets("\377"), "[ruby-dev:24460]")
      r.close
    end