do |mod|
      assert_raise_with_message(NameError, message % mod) do
        mod.alias_method :xyz, :class
      end