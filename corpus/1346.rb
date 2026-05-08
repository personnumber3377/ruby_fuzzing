do
      case []
      in [0, *a]
        raise a # suppress "unused variable: a" warning
      else
        true
      end