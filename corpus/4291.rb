do
      Thread.current[:foo] = :bar
      Thread.current.freeze
      assert_raise(FrozenError) do
        Thread.current[:foo] = :baz
      end