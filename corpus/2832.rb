do |tmpdir|
      tmp = File.join(tmpdir, 'x')
      File.open(tmp, :mode     => IO::RDWR | IO::CREAT | IO::BINARY,
                     :encoding => Encoding::ASCII_8BIT) do |x|

        assert_predicate(x, :autoclose?)
        assert_equal Encoding::ASCII_8BIT, x.external_encoding
        x.write 'hello'

        x.seek 0, IO::SEEK_SET

        assert_equal 'hello', x.read

      end