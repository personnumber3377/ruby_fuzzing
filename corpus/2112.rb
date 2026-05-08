do
      assert_raise_with_message(TypeError, /X\u{1f431}/) do
        o.method(cx)
      end