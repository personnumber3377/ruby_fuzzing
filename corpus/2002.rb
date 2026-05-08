do
      ['d', 'e'].each do |path|
        FileUtils.mkdir_p("c/#{path}/a/b/c")
        FileUtils.touch("c/#{path}/a/a.file")
        FileUtils.touch("c/#{path}/a/b/b.file")
        FileUtils.touch("c/#{path}/a/b/c/c.file")
      end