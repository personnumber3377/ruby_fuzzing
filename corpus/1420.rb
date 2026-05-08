do
      s = Struct.new(:a, :b, keyword_init: true)
      case s[a: 0, b: 1]
      in a:, c:
        raise a # suppress "unused variable: a" warning
        raise c # suppress "unused variable: c" warning
        flunk
      in a:, b:, c:
        flunk
      in b:
        b == 1
      end