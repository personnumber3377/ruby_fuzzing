dout, stderr, _status = EnvUtil.invoke_ruby(%w(-v --yjit-trace-exits), '', true, true)
    refute_includes(stderr, "NoMethodError")
  end