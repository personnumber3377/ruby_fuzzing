do
        begin
          p :before
          value = task.call
          p :never_reached
          success = true
        rescue StandardError => ex
          ex = ex.class
          p [:rescue, ex]
          reason = ex
          success = false
        end