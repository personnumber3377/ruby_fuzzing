do |r, e|
        assert_equal([], r)
        assert_operator(2, :<=, e.size)
        assert_match(/warning: openpath: pathname too long \(ignored\)/, e.first)
        assert_match(/\(LoadError\)/, e.last)
      end