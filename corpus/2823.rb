do |r, w|
      if File.pipe?(path = "/dev/fd/#{r.fileno}")
        assert_file.identical?(File.realpath(path), path)
      end