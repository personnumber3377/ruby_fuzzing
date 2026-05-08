do
      assert_raise(NameError) do
        Object.const_get(name)
      end