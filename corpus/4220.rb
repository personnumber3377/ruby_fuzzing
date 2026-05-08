do
      yielded.each do |val|
        assert_operator from, :<=, val
        assert_send