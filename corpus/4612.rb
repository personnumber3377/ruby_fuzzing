do |f|
      begin
        f2 = f.dup
        f.puts "foo"
        f2.puts "bar"
        f.close_write
        f2.close_write
        assert_equal("foo\nbar\n", f.read)
        assert_equal("", f2.read)
      ensure
        f2.close
      end