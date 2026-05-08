do |n|
        File.unlink(symlinkfile)
        link = "foo"*n
        begin
          File.symlink(link, symlinkfile)
        rescue Errno::ENAMETOOLONG
          break
        end