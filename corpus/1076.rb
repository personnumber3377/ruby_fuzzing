do
      Thread.new{ Fiber.new{ Thread.exit }.resume; raise "unreachable" }.join
    end