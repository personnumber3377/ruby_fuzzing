do |in_p, out_p, err_p, cpid|
      assert IO.select([out_p], nil, nil, 10), 'subprocess not ready'
      out_p.gets
      pid = cpid
      t0 = Time.now.to_f
      Process.kill(:SIGINT, pid)
      begin
        Timeout.timeout(10) { Process.wait(pid) }
      rescue Timeout::Error
        EnvUtil.terminate(pid)
        raise
      end