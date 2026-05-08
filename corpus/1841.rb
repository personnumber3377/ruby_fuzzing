do
      assert_file.not_fnmatch(pattern_ascii, path)
      assert_file.not_fnmatch(pattern_eucjp, path)
      assert_file.not_fnmatch(pattern_ascii, path, File::FNM_CASEFOLD)
      assert_file.not_fnmatch(pattern_eucjp, path, File::FNM_CASEFOLD)
      assert_file.fnmatch("{*,#{pattern_ascii}}", path, File::FNM_EXTGLOB)
      assert_file.fnmatch("{*,#{pattern_eucjp}}", path, File::FNM_EXTGLOB)
    end