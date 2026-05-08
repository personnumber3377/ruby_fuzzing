dows(f)
      if windows?
        assert_file_contents_has_lf(f)
      else
        assert_file_contents_has_crlf(f)
      end