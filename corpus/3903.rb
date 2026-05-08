do
      assert_equal({a: 42}, m.f2("a".to_sym => 42), '[ruby-core:82291] [Bug #13793]')
    end