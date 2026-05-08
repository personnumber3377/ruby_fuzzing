do |foo, _|
      klass = foo.class.to_s
      assert_separately([], "#{<<~"begin;"}\n#{<<~"end