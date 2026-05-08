doesn't match '/' if FNM_PATHNAME is set
    assert_file.fnmatch('foo?boo', 'foo/boo')
    assert_file.fnmatch('foo*', 'foo/boo')
    assert_file.not_fnmatch('foo?boo', 'foo/boo', File::FNM_PATHNAME)
    assert_file.not_fnmatch('foo*', 'foo/boo', File::FNM_PATHNAME)
  end