do |str, substr|
      assert_equal(3, str.index(substr), bug11488)
    end