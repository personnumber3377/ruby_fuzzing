do |a|
      Tempfile.create(["test_ruby_test_rubyoption", ".rb"]) do |t|
        [
          "begin", "if false", "for _ in []", "while false",
          "def foo", "class X", "module M",
          ["-> do", "end