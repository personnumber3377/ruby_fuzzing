do |data_type, values|
      format = [data_type] * values.size
      data_type_size = IO::Buffer.size_of(data_type)
      values_with_offsets = values.map.with_index{|value, index| [index * data_type_size, value]}

      buffer.set_values(format, 0, values)
      assert_equal values_with_offsets, buffer.each(data_type, 0, values.size).to_a, "Reading #{values} as #{data_type}."
    end