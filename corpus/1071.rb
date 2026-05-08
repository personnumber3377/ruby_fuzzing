do
      assert_raise(FiberError) do
        Fiber.current.resume
      end