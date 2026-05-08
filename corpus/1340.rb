do
      case [0]
      in [0, *a, 1]
        raise a # suppress "unused variable: a" warning
      else
        true
      end