do |name|
      assert_raise_with_message(ArgumentError, /must not be a constant path/) do
        m.set_temporary_name(name)
      end