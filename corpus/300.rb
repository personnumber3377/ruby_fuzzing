do
      method_test_rescue_should_not_cause_b_return
      begin
        method_test_ensure_should_not_cause_b_return
      rescue
        # ignore
      end