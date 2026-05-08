do |r1|
        assert_equal("a", r1.getc)
        pipe(proc do |w2|
          ret = IO.copy_stream(r1, w2)
          assert_equal(5, ret)
          w2.close
        end