do |data_type, values|
      format = [data_type] * values.size

      buffer.set_values(format, 0, values)
      assert_equal values, buffer.get_values(format, 0), "Converting #{values} as #{format}."
    end