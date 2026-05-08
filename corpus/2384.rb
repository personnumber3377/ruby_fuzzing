dosish = true
    when %r'\A//'
      assert_match(%r'\A//[^/]+/[^/]+\z', File.expand_path(".", "/"))
      assert_match(%r'\A//[^/]+/[^/]+/a\z', File.expand_path(".", "/"))
      dosish = true
    else
      assert_equal("/", File.expand_path(".", "/"))
      assert_equal("/sub", File.expand_path("sub", "/"))
    end