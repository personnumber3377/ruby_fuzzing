do |value|
      buffer.set_value(:u128, 0, value)
      assert_equal value, buffer.get_value(:u128, 0), "u128: #{value}"

      buffer.set_value(:U128, 0, value)
      assert_equal value, buffer.get_value(:U128, 0), "U128: #{value}"
    end