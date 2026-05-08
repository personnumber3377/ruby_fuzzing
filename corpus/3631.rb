do
      assert_equal("bar", ENV.fetch("test", "foo") { "bar" })
    end