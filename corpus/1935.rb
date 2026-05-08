do |name|
      assert_equal(:ok, Class.new.class_eval("#{name} = :ok; /(?<#{name}>.*)/ =~ 'ng'; #{name}"))
    end