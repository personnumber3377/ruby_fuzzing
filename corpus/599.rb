do |key, value|
        # The value may be incremented, but the class should stay the same
        other_value = RubyVM::ZJIT.stats(key)
        if value.class != other_value.class
          [key, value, other_value]
        end