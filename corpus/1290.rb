do
      x = 'x'
      case ['a', 'a', x]
      in ['a', "a", "#{x}"]
        true
      end