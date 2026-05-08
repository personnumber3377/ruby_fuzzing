dows(f)
      if windows?
        assert_file_contents_has_crlf(f)
      else
        assert_file_contents_has_lf(f)
      end