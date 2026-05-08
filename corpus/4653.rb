do |f|
      assert_equal File.read(__FILE__), f.readline(nil)
      assert_raise(EOFError) do
        f.readline
      end