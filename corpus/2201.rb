dom
    omit 'unstable on s390x and windows' if RUBY_PLATFORM =~ /s390x|mswin/
    assert_ractor("#{<<~"begin;"}\n#{<<~'end