does_not_modify_the_string_argument
    str = "./a/b/../c"
    assert_equal("#{Dir.pwd}/a/c", File.expand_path(str, Dir.pwd))
    assert_equal("./a/b/../c", str)
  end