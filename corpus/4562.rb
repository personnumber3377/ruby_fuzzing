do |r|
      assert_raise(IOError) do
        r.each_codepoint {|c| r.close if c == 32}
      end