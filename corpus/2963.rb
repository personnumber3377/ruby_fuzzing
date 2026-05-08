do
      assert_equal([], binding.implicit_parameters)
      assert_raise(NameError) { binding.implicit_parameter_get(:it) }
      assert_raise(NameError) { binding.implicit_parameter_get(:_1) }
      assert_equal(false, binding.implicit_parameter_defined?(:it))
      assert_equal(false, binding.implicit_parameter_defined?(:_1))
      "bar".tap do
        it or flunk
        assert_equal([:it], binding.implicit_parameters)
        assert_equal("bar", binding.implicit_parameter_get(:it))
        assert_raise(NameError) { binding.implicit_parameter_get(:_1) }
        assert_equal(true, binding.implicit_parameter_defined?(:it))
        assert_equal(false, binding.implicit_parameter_defined?(:_1))
      end