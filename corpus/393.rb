dows?
      Process.wait Process.spawn(*ECHO["e"], opts)
      assert_equal("e", File.read("out").chomp)
      opts = {STDOUT=>["out", File::WRONLY|File::CREAT|File::TRUNC, 0644]}
      opts.merge(3=>0, 4=>:in, 5=>STDIN, 6=>1, 7=>:out, 8=>STDOUT, 9=>2, 10=>:err, 11=>STDERR) unless windows?
      Process.wait Process.spawn(*ECHO["ee"], opts)
      assert_equal("ee", File.read("out").chomp)
      unless windows?
        # passing non-stdio fds is not supported on Windows
        File.open("out", "w") {|f|
          h = {STDOUT=>f, f=>STDOUT}
          3.upto(30) {|i| h[i] = STDOUT if f.fileno != i }
          Process.wait Process.spawn(*ECHO["f"], h)
          assert_equal("f", File.read("out").chomp)
        }
      end