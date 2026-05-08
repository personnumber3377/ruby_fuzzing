do |type, code|
      assert_no_memory_leak([], '', <<~RUBY, "fallback type is #{type}", rss: true)
        class MyError < StandardError; end