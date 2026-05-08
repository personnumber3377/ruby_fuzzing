do
      case CDeconstructCache.new([[0]])
      in [x] if x > 0
      in [0]
        true
      end