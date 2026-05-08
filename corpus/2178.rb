do |v|
      assert_match(/\A(?:foo|bar)\z/, v)
      case v
      when /foo/
        assert_same(x1, v)
      when /bar/
        assert_same(x2, v)
      end