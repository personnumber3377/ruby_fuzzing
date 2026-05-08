do |tmpdir|
      cmd = nil
      message = proc do
        [
         '[ruby-talk:258939]',
         "out.txt:",
         *File.readlines("out.txt").map{|s|"  "+s.inspect},
         "err.txt:",
         *File.readlines("err.txt").map{|s|"  "+s.inspect},
         "system(#{cmd.inspect})"
        ].join("\n")
      end