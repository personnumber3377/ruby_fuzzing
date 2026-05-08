do
      case [0, 1, 2]
      in x
        x = x # avoid a warning "assigned but unused variable - x"
        true
      in [*, 2, *]
        false
      end