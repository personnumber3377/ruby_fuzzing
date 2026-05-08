do |buffer|
      refute_predicate buffer, :readonly?

      buffer.set_value(:U8, 0, "h".ord)

      # Buffer releases it's ownership of the string:
      buffer.free

      assert_equal "hello World", string
    end