does_not_expand_wildcards
    assert_equal("#{DRIVE}/*", File.expand_path("./*", "#{DRIVE}/"))
    assert_equal("#{Dir.pwd}/*", File.expand_path("./*", Dir.pwd))
    assert_equal("#{DRIVE}/?", File.expand_path("./?", "#{DRIVE}/"))
    assert_equal("#{Dir.pwd}/?", File.expand_path("./?", Dir.pwd))
  end