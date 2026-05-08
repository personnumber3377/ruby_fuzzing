do |n|
      assert_not_respond_to(c, n, "Complex##{n}")
    end