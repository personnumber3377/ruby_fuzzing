do |r, w|
      assert_raise(IOError) do
        r.write "foobarbaz"
      end