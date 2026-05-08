dows?
        # currently telling to child the file modes is not supported.
        File.write("out", "0\n", mode: "a")
      else
        Process.wait Process.spawn(*ECHO["0"], STDOUT=>["out", File::WRONLY|File::CREAT|File::APPEND, 0644])
        assert_equal("a\n0\n", File.read("out"))
      end