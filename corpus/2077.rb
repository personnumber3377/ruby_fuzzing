don't break
    # compatibility against silly example codes.
    assert_separately([], <<-RUBY)
    trap(:HUP, "DEFAULT")
    assert_raise(SignalException) {
      Process.kill('HUP', Process.pid)
    }
    RUBY
    bug8137 = '[ruby-dev:47182] [Bug #8137]'
    assert_nothing_raised(bug8137) {
      Timeout.timeout(1) {
        Process.kill(0, Process.pid)
      }
    }
  end