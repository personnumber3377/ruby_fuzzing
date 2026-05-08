do not make sense in that context.
    else
      message = e1.message.each_line
      message.with_index(1) do |line, i|
        next if /^ / =~ line
        assert_send