do
        module C
          begin
            B
          rescue NameError
            puts "NameError"
          end