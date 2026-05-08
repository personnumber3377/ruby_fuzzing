do |lib|
    define_method "test_thread_size:#{lib}" do
      assert_separately(['-W0'], "#{<<~"begin;"}\n#{<<~"end