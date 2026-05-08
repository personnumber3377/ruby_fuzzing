do |w2|
          ret = IO.copy_stream(r1, w2, 0)
          assert_equal(0, ret)
          w2.close
        end