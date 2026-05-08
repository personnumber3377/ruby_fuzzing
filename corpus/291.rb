do
      assert_raise(FOO_ERROR, bug_7624) do
        m1_test_trace_point_at_return_when_exception
      end