do |_out, err, _status|
      def foo(*, &block) = block
      def bar(buz, ...) = foo(buz, ...)
      bar(:test) {} # do not warn because of forwarding
    RUBY
      assert_equal 0, err.size, err.join("\n")
    end