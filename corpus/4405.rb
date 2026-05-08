", 1, 1, 1)
    end
  end

  class InstanceExec
    INSTANCE_EXEC = 123
  end

  def test_instance_exec
    x = 1.instance_exec(42) {|a| self + a }
    assert_equal(43, x)

    x = "foo".instance_exec("bar