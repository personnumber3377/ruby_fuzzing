double-swap should restore original)
      buffer.set_value(be_type, 0, swapped_value_le_to_be)
      round_trip_value = buffer.get_value(le_type, 0)
      assert_equal value, round_trip_value, "#{le_type}/#{be_type}: double-swap should restore original value"
    end