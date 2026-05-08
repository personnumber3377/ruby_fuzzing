do
        sleep 0.5 # finalizer shouldn't be run with VM lock, otherwise this context switch will crash
      end