do |value|
      buffer.set_value(:s128, 0, value)
      assert_equal value, buffer.get_value(:s128, 0), "s128: #{value}"

      buffer.set_value(:S128, 0, value)
      assert_equal value, buffer.get_value(:S128, 0), "S128: #{value}"
    end