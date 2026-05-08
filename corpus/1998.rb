do
      q.push nil
      assert_instance_of(RuntimeError, t.value)
    end