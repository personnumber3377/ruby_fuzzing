do |klass|
      [[], [true]].each do |args|
        assert_method_not_defined?(klass, [:wombat, *args])
        assert_method_defined?(klass, [:mixin, *args])
        assert_method_defined?(klass, [:user, *args])
        assert_method_defined?(klass, [:user2, *args])
        assert_method_not_defined?(klass, [:user3, *args])

        assert_method_not_defined?(klass, ["wombat", *args])
        assert_method_defined?(klass, ["mixin", *args])
        assert_method_defined?(klass, ["user", *args])
        assert_method_defined?(klass, ["user2", *args])
        assert_method_not_defined?(klass, ["user3", *args])
      end