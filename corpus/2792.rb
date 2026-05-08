do
      compile(<<~RUBY)
        proc do
          next

          case nil
          when "a"
            next
          when "b"
          when "c"
            proc {}
          end