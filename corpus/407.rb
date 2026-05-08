dows?
        expected = "hehe ppid=#{status.pid}"
      else
        expected = "hehe pid=#{status.pid} ppid=#{$$}"
      end