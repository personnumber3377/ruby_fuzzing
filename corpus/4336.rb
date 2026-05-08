do
        Fiber.new do
          raise "FAILED!" if mutexes.any?(&:owned?)
        end