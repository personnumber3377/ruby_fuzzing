dopen_bin_mode_read_crlf
      open_file_with(:c_rb_io_fdopen, @read_path_with_crlf, 'rb') { |f| assert_file_contents_has_crlf(f) }
    end