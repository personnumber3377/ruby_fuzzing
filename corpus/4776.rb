dows?
        # NOTE: re-opening with O_TEMPORARY does not work.
        path = self.path
        ret = super
        if unlink_now
          begin
            File.unlink(path)
          rescue Errno::ENOENT
          rescue Errno::EACCES
            sleep(2)
            retry
          end