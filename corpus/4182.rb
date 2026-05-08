do
        str = eval("# frozen-string-literal: false\n""'foo'")
        assert_not_predicate(str, :frozen?)
      end