dotmatch
    # wildcard matches leading period if FNM_DOTMATCH is set
    assert_file.not_fnmatch('*', '.profile')
    assert_file.fnmatch('*', '.profile', File::FNM_DOTMATCH)
    assert_file.fnmatch('.*', '.profile')
    assert_file.fnmatch('*', 'dave/.profile')
    assert_file.fnmatch('*/*', 'dave/.profile')
    assert_file.not_fnmatch('*/*', 'dave/.profile', File::FNM_PATHNAME)
    assert_file.fnmatch('*/*', 'dave/.profile', File::FNM_PATHNAME | File::FNM_DOTMATCH)
  end