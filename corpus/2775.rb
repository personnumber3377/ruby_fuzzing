do
        def initialize_dup(_)
          if $raise_on_dup
            raise MyError
          else
            super
          end