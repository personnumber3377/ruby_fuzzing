do |r|
      assert_raise(IOError) do
        r.each_byte {|byte| r.close if byte == 32 }
      end