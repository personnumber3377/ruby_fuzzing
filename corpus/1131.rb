do
      Class.new {
        refine Integer do
          def foo
            "c"
          end