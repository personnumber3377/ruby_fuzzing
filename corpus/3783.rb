doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    objs = 10_000.times.map do
      ExIvar.new
    end