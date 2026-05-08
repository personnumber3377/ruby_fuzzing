do |string|
      assert_raise(RegexpError) do
        Regexp.new(string)
      end