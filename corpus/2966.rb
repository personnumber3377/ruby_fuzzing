do
      it or flunk
      it = it = "bar"

      assert_equal([:it], binding.implicit_parameters)
      assert_equal("foo", binding.implicit_parameter_get(:it))
      assert_equal(true, binding.implicit_parameter_defined?(:it))

      assert_equal([:it], binding.local_variables)
      assert_equal("bar", binding.local_variable_get(:it))
      assert_equal(true, binding.local_variable_defined?(:it))
    end