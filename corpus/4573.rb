do |w2|
          ret = IO.copy_stream(r1, w2)
          assert_equal(2, ret)
          w2.close
        end