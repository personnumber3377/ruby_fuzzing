do
      assert_raise_with_message(ArgumentError, /\u{30eb 30d3 30fc}/) { Process.getrlimit("\u{30eb 30d3 30fc}") }
    end