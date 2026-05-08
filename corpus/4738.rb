do |io|
        assert_raise(ArgumentError, bug4024) do
          io.readlines(0)
        end