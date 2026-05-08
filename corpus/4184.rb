do
        str = eval("# x frozen-string-literal: false\n""'foo'")
        assert_equal(default, str.frozen?)
      end