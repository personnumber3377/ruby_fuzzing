do |dirname|
      Dir.chdir(dirname) do
        begin
          File.symlink('some-dir', 'dir-symlink')
        rescue NotImplementedError, Errno::EACCES
          return
        end