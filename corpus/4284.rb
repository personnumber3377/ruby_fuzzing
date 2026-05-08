do |name, limit|
    define_method("test_join_limit_#{name}") do
      t = Thread.new {}
      assert_same t, t.join(limit), "limit=#{limit.inspect}"
    end