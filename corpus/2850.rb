do |f|
        f.set_encoding Encoding::UTF_8, '-'
        assert_file_contents_has_crlf(f)
      end