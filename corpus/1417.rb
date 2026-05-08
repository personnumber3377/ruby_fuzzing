do
      s = Struct.new(:a, :b)
      case s[0, 1]
      in 0, 1
        true
      end