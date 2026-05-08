dot_dir
    assert_equal("#{DRIVE}/dir", File.expand_path("#{DRIVE}/./dir"))
  end