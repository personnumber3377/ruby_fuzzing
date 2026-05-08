do |f|
        f.gets
        f2 = open(t.path)
        begin
          f2.gets
          assert_nothing_raised {
            f.reopen(f2)
            assert_equal("bar\n", f.gets, '[ruby-core:24240]')
          }
        ensure
          f2.close
        end