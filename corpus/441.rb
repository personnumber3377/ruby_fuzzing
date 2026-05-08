do
        begin
          system(*TRUECOMMAND, uid: uid, exception: true)
        rescue Errno::EPERM, Errno::EACCES, NotImplementedError
        end