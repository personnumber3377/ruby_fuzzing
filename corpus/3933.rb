doit.call
        }
        assert(ret)
        if s2 == s3
          assert_equal(s1, t, desc)
        else
          assert_not_equal(s1, t, desc)
        end