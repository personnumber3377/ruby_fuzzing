doit, g|
        if !s1.valid_encoding?
          assert_raise(ArgumentError, desc) { doit.call }
          next
        end