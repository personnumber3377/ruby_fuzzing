do
      s = Struct.new(:a, :b, keyword_init: true)
      case s[a: 0, b: 1]
      in a:, b:
        a == 0 && b == 1
      end