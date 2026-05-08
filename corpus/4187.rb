do
        str = eval("# frozen-string-literal: true x\n""'foo'")
        assert_equal(default, str.frozen?)
      end