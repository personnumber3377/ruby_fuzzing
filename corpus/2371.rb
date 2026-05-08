do |child|
          assert_predicate child, :type
          walk_ast child
        end