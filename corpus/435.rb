do |f|
        if f
          assert_equal(f.pid, Process.wait(f.pid))

          dpid, ppid, dsid = 3.times.map {Integer(f.gets)}

          message = "daemon #{dpid} should be detached"
          assert_not_equal($$, ppid, message) # would be 1 almost always
          assert_raise(Errno::ECHILD, message) {Process.wait(dpid)}
          assert_kind_of(Integer, Process.kill(0, dpid), message)
          assert_equal(dpid, dsid)

          break # close f, and let the daemon resume and exit
        end