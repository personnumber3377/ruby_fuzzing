do |f|
        f2 = open(t.path)
        begin
          f.reopen(f2)
          assert_equal("foo\n", f.gets)
          assert_equal("bar\n", f.gets)
          f.reopen(f2)
          assert_equal("baz\n", f.gets, '[ruby-dev:39479]')
        ensure
          f2.close
        end