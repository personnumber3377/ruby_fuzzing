do |k, v|
      assert_match(/\A(?:foo|bar)\z/, k)
      case k
      when /foo/
        assert_same(k1, k)
        assert_same(x1, v)
      when /bar/
        assert_same(k2, k)
        assert_same(x2, v)
      end