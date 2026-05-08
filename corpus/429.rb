dows?

    pid = 0

    with_tmpchdir do
      assert_nothing_raised('[ruby-dev:12261]') do
        EnvUtil.timeout(10) do
          pid = spawn('yes | ls')
          Process.waitpid pid
        end