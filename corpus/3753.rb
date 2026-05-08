do
            ITERATIONS_PER_THREAD.times do
              require PATH
              $".delete_if {|p| Regexp.new(PATH) =~ p}
            end