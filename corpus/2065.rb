dout, stderr, status = EnvUtil.invoke_ruby([env, '-e', script], '', true, true, timeout: 30)
    assert(!status.signaled?, FailDesc[status, nil, stderr])

    return stdout
  end