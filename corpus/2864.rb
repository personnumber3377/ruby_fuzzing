dopen_text_mode_write_lf
      open_file_with(:c_rb_io_fdopen, @write_path, 'w') { |f| f.write TEST_STRING_WITH_LF }
      File.open(@write_path, 'rb') { |f| assert_file_contents_has_crlf_on_windows(f) }
    end