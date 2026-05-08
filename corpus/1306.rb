do
      $TestPatternMatching = /a/
      case 'abc'
      in ^$TestPatternMatching
        true
      end