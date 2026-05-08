do |str, substr|
      assert_equal(true, str.include?(substr), bug11488)
    end