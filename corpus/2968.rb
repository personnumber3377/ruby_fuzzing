do
      _5 and flunk
      "bar".tap do
        it or flunk
        assert_equal([:it], binding.implicit_parameters)
        assert_equal("bar", binding.implicit_parameter_get(:it))
        assert_raise(NameError) { binding.implicit_parameter_get(:_1) }
        assert_raise(NameError) { binding.implicit_parameter_get(:_5) }
        assert_raise(NameError) { binding.implicit_parameter_get(:_6) }
        assert_equal(true, binding.implicit_parameter_defined?(:it))
        assert_equal(false, binding.implicit_parameter_defined?(:_1))
        assert_equal(false, binding.implicit_parameter_defined?(:_5))
        assert_equal(false, binding.implicit_parameter_defined?(:_6))
      end