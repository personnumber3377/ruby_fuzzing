do
      assert_raise_with_message(TypeError, /:"\\u3042"/) {1+:"\u{3042}"}
      assert_raise_with_message(TypeError, /:"\\u3042"/) {1&:"\u{3042}"}
      assert_raise_with_message(TypeError, /:"\\u3042"/) {1|:"\u{3042}"}
      assert_raise_with_message(TypeError, /:"\\u3042"/) {1^:"\u{3042}"}
    end