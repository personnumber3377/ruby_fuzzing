do
        str = eval("# frozen-string-literal: false x\n""'foo'")
        assert_equal(default, str.frozen?)
      end