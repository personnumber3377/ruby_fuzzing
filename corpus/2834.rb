do |tmpdir|
      tmp = File.join(tmpdir, 'x')
      File.open(tmp, mode: IO::WRONLY | IO::CREAT | IO::BINARY | IO::SHARE_DELETE) do |f|
        assert_file.exist?(tmp)
        assert_nothing_raised do
          File.unlink(tmp)
        end