do
      assert_raise_with_message(ArgumentError, /\u{1f4a1}/) {Float("\u{1f4a1}")}
    end