do |f|
        tpid = #{$$}
        sig = :#{sig}
        {#1
          STDOUT.sync = true
          while gets
            puts
            Process.kill(sig, tpid)
          end