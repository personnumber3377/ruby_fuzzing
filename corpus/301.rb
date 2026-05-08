do
      begin
        method_test_argument_error_on_bmethod(wrong_key: 2)
      rescue
        # ignore
      end