do
      assert_deprecated_warning {o.bar { :foo }}.call
    end