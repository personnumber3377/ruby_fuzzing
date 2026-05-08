do |data_type, values|
      values.each do |value|
        buffer.set_value(data_type, 0, value)
        assert_equal value, buffer.get_value(data_type, 0), "Converting #{value} as #{data_type}."
      end