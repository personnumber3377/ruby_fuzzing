does_not_modify_a_home_string_argument
    old_home = ENV["HOME"]
    home = ENV["HOME"] = "#{DRIVE}/UserHome"
    str = "~/a"
    assert_equal("#{home}/a", File.expand_path(str))
    assert_equal("~/a", str)
  ensure
    ENV["HOME"] = old_home
  end