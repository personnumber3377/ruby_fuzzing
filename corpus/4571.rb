do |w2|
          w2.sync = false
          w2 << "def"
          ret = IO.copy_stream(r1, w2, 1)
          assert_equal(1, ret)
          w2.close
        end