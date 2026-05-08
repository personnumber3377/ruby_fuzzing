do
          exec ruby, '-e', 'print IO.for_fd(3).read(1)', 3 => a[0], 1 => b[1]
        end