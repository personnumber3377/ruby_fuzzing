do |tmpdir|
      begin
        io = File.open(tmpdir, File::RDWR | File::TMPFILE)
      rescue Errno::EINVAL
        omit 'O_TMPFILE not supported (EINVAL)'
      rescue Errno::EISDIR
        omit 'O_TMPFILE not supported (EISDIR)'
      rescue Errno::EOPNOTSUPP
        omit 'O_TMPFILE not supported (EOPNOTSUPP)'
      end