do
      it = it = "bar"

      assert_equal([], binding.implicit_parameters)
      assert_raise(NameError) { binding.implicit_parameter_get(:it) }
      assert_equal(false, binding.implicit_parameter_defined?(:it))

      assert_equal([:it], binding.local_variables)
      assert_equal("bar", binding.local_variable_get(:it))
      assert_equal(true, binding.local_variable_defined?(:it))
    end