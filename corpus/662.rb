do |tmpdir|
      name = "\u{30c6 30b9 30c8}"
      tmpfilename = "#{tmpdir}/#{name}.cmd"
      message = /#{name}\.cmd/
      assert_raise_with_message(Errno::ENOENT, message) do
        system(tmpfilename, exception: true)
      end