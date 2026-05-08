double_include2
    assert_equal([:Base, :Override, :A, :Override, :B],
                 DoubleInclude2::B.new.foo)
  end