do
        str = eval("# x frozen-string-literal: true\n""'foo'")
        assert_equal(default, str.frozen?)
      end