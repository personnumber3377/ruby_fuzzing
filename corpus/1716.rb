do |f|
          Timeout.timeout(timeout) do
            assert(!f.flock(File::LOCK_SH|File::LOCK_NB))
          end