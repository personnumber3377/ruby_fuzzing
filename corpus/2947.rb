do
      assert_deprecated_warning {o.foo { :foo }}.call
    end