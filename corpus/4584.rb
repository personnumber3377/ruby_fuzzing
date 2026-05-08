do |r,w|
        r.nonblock = true
        assert_cpu_usage_low(msg, stop: ->{w.close}) do
          IO.copy_stream(r, IO::NULL)
        end