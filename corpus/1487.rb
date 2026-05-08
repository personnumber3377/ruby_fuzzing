do |method, arg|
      assert_equal Enumerator::Lazy, [].lazy.send