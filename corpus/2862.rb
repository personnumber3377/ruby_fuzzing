dopen_text_mode_read_lf
      open_file_with(:c_rb_io_fdopen, @read_path_with_lf, 'r') { |f| assert_file_contents_has_lf(f) }
    end