do |_out, err, _status|
      def foo = nil
      10.times{foo{}} # warn once
    RUBY
      assert_equal 1, err.size
    end