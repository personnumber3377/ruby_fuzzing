dows platform" if windows?
    omit "root can use Process.groups on Android platform" if RUBY_PLATFORM =~ /android/
    feature6975 = '[ruby-core:47414]'

    groups = Process.groups.map do |g|
      g = Etc.getgrgid(g) rescue next
      [g.name, g.gid]
    end