do |dir|
      list = SEGVTest::ExpectedStderrList
      if cmd
        FileUtils.mkpath(File.join(dir, File.dirname(cmd)))
        File.write(File.join(dir, cmd), SEGVTest::KILL_SELF+"\n")
        c = Regexp.quote(cmd)
        list = list.map {|re| Regexp.new(re.source.gsub(/^\s*(\(\?:)?\K-e(?=:)/) {c}, re.options)}
      else
        cmd = ['-e', SEGVTest::KILL_SELF]
      end