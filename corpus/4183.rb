do
        str = eval("# frozen-string-literal: true\n""'foo'")
        assert_predicate(str, :frozen?)
      end