do |meth|
      assert_raise_with_message(ArgumentError, /wrong number of arguments \(given #{OVER_STACK_LEN}, expected 0(\.\.[12])?\)/) do
        yield_block(meth, *OVER_STACK_ARGV, &l)
      end