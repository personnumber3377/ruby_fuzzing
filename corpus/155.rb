do
      begin;
        def foo
          self::FOO, self::BAR = 1, 2
          ::FOO, ::BAR = 1, 2
        end