do |m|
        Fiber.new do
          m.lock
        end