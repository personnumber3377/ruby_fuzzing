do
      _9 and flunk
      assert_equal([], binding.local_variables)
      assert_raise(NameError) { binding.local_variable_get(:_9) }
      assert_raise(NameError) { binding.local_variable_set(:_9, 1) }
      assert_raise(NameError) { binding.local_variable_defined?(:_9) }
      "bar".tap do
        assert_equal([], binding.local_variables)
        assert_raise(NameError) { binding.local_variable_get(:_9) }
        assert_raise(NameError) { binding.local_variable_set(:_9, 1) }
        assert_raise(NameError) { binding.local_variable_defined?(:_9) }
      end