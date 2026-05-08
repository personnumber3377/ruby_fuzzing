dows? # passing non-stdio fds is not supported on Windows

  def test_execopts_redirect_tempfile
    bug6269 = '[ruby-core:44181]'
    Tempfile.create("execopts") do |tmp|
      pid = assert_nothing_raised(ArgumentError, bug6269) do
        break spawn(RUBY, "-e", "print $$", out: tmp)
      end