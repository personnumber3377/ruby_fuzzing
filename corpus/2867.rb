dopen_text_mode_read_crlf_with_utf8_encoding
      open_file_with(:c_rb_io_fdopen, @read_path_with_crlf, 'r') do |f|
        f.set_encoding Encoding::UTF_8, '-'
        assert_file_contents_has_lf_on_windows(f)
      end