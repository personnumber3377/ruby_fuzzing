do
      assert_equal(:ok, o.method(:foo).call, bug9315)
    end