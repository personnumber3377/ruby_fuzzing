dout, stderr, _status = invoke_ruby(%w(-v --yjit-stats), '', true, true)
    refute_includes(stderr, "NoMethodError")
  end