do |method|
      assert_separately(%w(-W0), <<~RUBY)
        exp_name = "int" + "ernal"
        Encoding.default_internal = Encoding::ASCII_8BIT
        name = Encoding.#{method}.find { |x| x == exp_name }
        Encoding.default_internal = nil
        assert_equal exp_name, name, "Encoding.#{method} [Bug #20595] [Bug #20598]"
      RUBY
    end