do |enc|
    define_method("test_reopen_nonascii(#{enc})") do
      mkcdtmpdir do
        fname = "\u{30eb 30d3 30fc}".encode(enc)
        File.write(fname, '')
        assert_file.exist?(fname)
        stdin = $stdin.dup
        begin
          assert_nothing_raised(Errno::ENOENT, "#{bug11320}: #{enc}") {
            $stdin.reopen(fname, 'r')
          }
        ensure
          $stdin.reopen(stdin)
          stdin.close
        end