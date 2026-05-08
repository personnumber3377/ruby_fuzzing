do
      begin
        Fiber.yield
      rescue
        Fiber.yield :ok
      end