do
      m1_for_test_trace_point_binding_in_ifunc(0)
      assert_equal(self, eval('self', tp_b), '[ruby-dev:46960]')

      m2_for_test_trace_point_binding_in_ifunc([0, nil])
      assert_equal(self, eval('self', tp_b), '[ruby-dev:46960]')
    end