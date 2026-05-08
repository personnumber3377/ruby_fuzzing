do |v|
      assert_empty v.instance_variables
      msg = "can't modify frozen #{v.class}: #{v.inspect}"

      assert_raise_with_message(FrozenError, msg) do
        v.instance_variable_set(:@foo, :bar)
      end