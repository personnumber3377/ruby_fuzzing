do |lparen, rparen, bug|
      s = "\\#{lparen}a\\#{rparen}"
      assert_equal(/#{s}/, eval("%r#{lparen}#{s}#{rparen}"), bug)
    end