do
      assert_raise_with_message(ArgumentError, /\u{1f4a1}/) {Integer("\u{1f4a1}")}
    end