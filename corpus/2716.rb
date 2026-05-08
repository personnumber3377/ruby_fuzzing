double_include
    assert_equal([:Base, :Override, :Override], DoubleInclude::B.new.foo, "[Bug #3351]")
  end