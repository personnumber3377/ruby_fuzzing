do |k|
      assert_predicate(ENV[k], :frozen?, "[#{k.dump}]")
      assert_predicate(ENV.fetch(k), :frozen?, "fetch(#{k.dump})")
    end