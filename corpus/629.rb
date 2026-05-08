do
      assert_raise_with_message(ArgumentError, /\u{221a 2668}/) {
        Rational("\u{221a 2668}")
      }
    end