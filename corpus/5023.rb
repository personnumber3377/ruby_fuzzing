do |mod|
      assert_raise_with_message(RuntimeError, /permanent name/) do
        mod.set_temporary_name("fake_name")
      end