dopen(t.fileno)
    begin
      w.close
      begin
        t.close
      rescue Errno::EBADF
      end