do this
  # here so that the various tests that reference RUBY_DESCRIPTION don't have to
  # worry about it. The flag itself is tested in its own test.
  RUBY_DESCRIPTION =
    if ParserSupport.prism_enabled_in_subprocess?
      ::RUBY_DESCRIPTION
    else
      ::RUBY_DESCRIPTION.sub(/\+PRISM /, '')
    end