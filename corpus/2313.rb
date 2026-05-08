do
      assert_raise_with_message(TypeError, /A\u{3042}/) {
        o::Foo
      }
    end