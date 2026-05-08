do
      assert_syntax_error('foo.[] bar, ...', /unexpected/, verbose: true)
    end