do
      it or flunk

      assert_equal([:it], binding.implicit_parameters)
      assert_equal("foo", binding.implicit_parameter_get(:it))
      assert_equal(true, binding.implicit_parameter_defined?(:it))

      assert_equal([], binding.local_variables)
      assert_raise(NameError) { binding.local_variable_get(:it) }
      assert_equal(false, binding.local_variable_defined?(:it))
    end