do
      assert_match(/resumed/, f.to_s)
      Fiber.yield
    end