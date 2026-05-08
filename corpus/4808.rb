do
          # Wait until the main thread has entered `$stdin.gets`:
          Thread.pass until main.status == 'sleep'

          # Cause an interrupt while handling `$stdin.gets`:
          Process.kill :INT, $$
        end