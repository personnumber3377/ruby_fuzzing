dout by #full_message")

    _, err2, status1 = EnvUtil.invoke_ruby(['-e', "#{test_method}; begin; foo; end