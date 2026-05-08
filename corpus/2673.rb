do |meth|
      assert_raise_with_message(ArgumentError, /wrong number of arguments \(given #{OVER_STACK_LEN}, expected 0(\.\.[12])?\)/) do
        instance_eval(":#{meth}.to_proc.(self, *OVER_STACK_ARGV)", __FILE__, __LINE__)
      end