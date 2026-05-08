do |r, w|
      assert_raise(IOError) do
        r.close_write
      end