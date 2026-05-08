do
      case 0
      in a
        assert_equal(0, a)
        true
      in a
        flunk
      end