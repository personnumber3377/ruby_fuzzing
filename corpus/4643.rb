do |r, w|
      assert_raise(IOError) do
        w.close_read
      end