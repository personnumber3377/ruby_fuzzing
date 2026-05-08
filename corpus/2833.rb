double_mode
    assert_raise_with_message(ArgumentError, 'mode specified twice') {
      File.open("a", 'w', :mode => 'rw+')
    }
  end