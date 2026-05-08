do
      assert_raise(EncodingError) do
        Math.const_defined?("\xC3")
      end