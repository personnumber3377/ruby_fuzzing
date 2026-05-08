do
      bug15649 = '[ruby-core:91728] [Bug #15649]'
      assert_equal(["#{@root}/a", "#{@root}/b"],
                   Dir.glob("{#{@root}/a,#{@root}/b}"), bug15649)
    end