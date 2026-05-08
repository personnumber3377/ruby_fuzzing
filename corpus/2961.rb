do
      assert_equal([], binding.local_variables)
      assert_raise(NameError) { binding.local_variable_get(:it) }
      assert_equal(false, binding.local_variable_defined?(:it))
      "bar".tap do
        it
        assert_equal([], binding.local_variables)
        assert_raise(NameError) { binding.local_variable_get(:it) }
        assert_equal(false, binding.local_variable_defined?(:it))
      end