do
      it or flunk
      "bar".tap do
        _5 and flunk
        assert_equal([:_1, :_2, :_3, :_4, :_5], binding.implicit_parameters)
        assert_raise(NameError) { binding.implicit_parameter_get(:it) }
        assert_equal("bar", binding.implicit_parameter_get(:_1))
        assert_equal(nil, binding.implicit_parameter_get(:_5))
        assert_raise(NameError) { binding.implicit_parameter_get(:_6) }
        assert_equal(false, binding.implicit_parameter_defined?(:it))
        assert_equal(true, binding.implicit_parameter_defined?(:_1))
        assert_equal(true, binding.implicit_parameter_defined?(:_5))
        assert_equal(false, binding.implicit_parameter_defined?(:_6))
      end