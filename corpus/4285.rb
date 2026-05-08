do |name, limit|
    define_method("test_join_limit_negative_#{name}") do
      t = Thread.new { sleep }
      begin
        assert_nothing_raised(Timeout::Error) do
          Timeout.timeout(30) do
            assert_nil t.join(limit), "limit=#{limit.inspect}"
          end