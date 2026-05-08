do
      assert_equal(["#{@root}/a", "#{@root}/b"], Dir.glob("#{@root}/[ba]"))
      assert_equal(["#{@root}/b", "#{@root}/a"], Dir.glob(%W"#{@root}/b #{@root}/a"))
      assert_equal(["#{@root}/b", "#{@root}/a"], Dir.glob("#{@root}/{b,a}"))
    end