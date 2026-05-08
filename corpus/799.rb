do
      assert_valid_syntax("foo \\\n(\n  true)", "test", verbose: true)
    end