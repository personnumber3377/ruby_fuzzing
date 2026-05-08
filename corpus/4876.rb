do
      assert_raise_with_message(TypeError, /X\u{3042}/) { c1.const_set(cx, :foo) }
    end