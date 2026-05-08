dows?
        Dir.mkdir(path = "path with space")
        File.write(bat = path + "/bat test.bat", "@echo %1>out")
        system(bat, "foo 'bar'")
        assert_equal(%["foo 'bar'"\n], File.read("out"), '[ruby-core:22960]')
        system(%[#{bat.dump} "foo 'bar'"])
        assert_equal(%["foo 'bar'"\n], File.read("out"), '[ruby-core:22960]')
      end