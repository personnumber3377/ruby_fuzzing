dopen_bin_mode_write_crlf
      open_file_with(:c_rb_io_fdopen, @write_path, 'wb') { |f| f.write TEST_STRING_WITH_CRLF }
      File.open(@write_path, 'rb') { |f| assert_file_contents_has_crlf(f) }
    end