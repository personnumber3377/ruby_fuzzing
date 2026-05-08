do |k|
      assert_match(/\A(?:foo|bar)\z/, k)
      case k
      when /foo/
        assert_same(k1, k)
      when /bar/
        assert_same(k2, k)
      end