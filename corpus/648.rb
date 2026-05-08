do
          sleep 0.1
          main_th.raise(my_error)
        end