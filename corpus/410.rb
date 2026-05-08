dows?
        Dir.mkdir(path = "path with space")
        File.write(bat = path + "/bat test.bat", "@echo %1")
        r = IO.popen([bat, "foo 'bar'"]) {|f| f.read}
        assert_equal(%["foo 'bar'"\n], r, '[ruby-core:22960]')
        r = IO.popen(%[#{bat.dump} "foo 'bar'"]) {|f| f.read}
        assert_equal(%["foo 'bar'"\n], r, '[ruby-core:22960]')
      end