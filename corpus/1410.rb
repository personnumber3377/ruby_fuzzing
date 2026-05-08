do
      case CDeconstructCache.new([[0, :a, 1]])
      in [*, String => x, *]
        false
      in [*, Symbol => x, *]
        x == :a
      end