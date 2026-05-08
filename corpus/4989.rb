do |name|
      e = assert_raise(NameError) do
        Module.new { attr_accessor name.to_sym }
      end