do |g|
        Thread.new do
          g << 1
        end