do
      assert_raise_with_message(TypeError, /X\u{1F431}/) do
        Class.new {define_method(cx) {}}
      end