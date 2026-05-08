dopen_text_mode_read_crlf
      open_file_with(:c_rb_io_fdopen, @read_path_with_crlf, 'r') { |f| assert_file_contents_has_lf_on_windows(f) }
    end