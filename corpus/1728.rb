do
      assert_raise_with_message(TypeError, /:\u{3042}/) {1+:"\u{3042}"}
      assert_raise_with_message(TypeError, /:\u{3042}/) {1&:"\u{3042}"}
      assert_raise_with_message(TypeError, /:\u{3042}/) {1|:"\u{3042}"}
      assert_raise_with_message(TypeError, /:\u{3042}/) {1^:"\u{3042}"}

      assert_raise_with_message(TypeError, /:\u{3044}/) {1+"\u{3044}".to_sym}
      assert_raise_with_message(TypeError, /:\u{3044}/) {1&"\u{3044}".to_sym}
      assert_raise_with_message(TypeError, /:\u{3044}/) {1|"\u{3044}".to_sym}
      assert_raise_with_message(TypeError, /:\u{3044}/) {1^"\u{3044}".to_sym}
    end