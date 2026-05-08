do |io|
        assert_raise(ArgumentError, bug4024) do
          io.each_line(0).next
        end