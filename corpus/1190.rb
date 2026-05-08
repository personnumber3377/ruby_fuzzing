do

          assert_equal(:foo, C.new.m)
          assert_equal(:foo, m)

          alias m m

          assert_equal(:foo, C.new.m)
          assert_equal(:foo, m)

          def m
            :bar
          end