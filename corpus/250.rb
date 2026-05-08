do |n|
      m = Module.new
      assert_not_operator(m, :const_defined?, n)
      assert_raise_with_message(NameError, /uninitialized/) do
        m.const_get(n)
      end