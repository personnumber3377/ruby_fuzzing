do |path|
      e = assert_raise(LoadError, bug3758) {require path}
      assert_operator(e.message, :end