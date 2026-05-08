dows?
        Dir.mkdir(path = "path with space")
        File.write(bat = path + "/bat test.bat", "@echo %1>out")
        pid = spawn(bat, "foo 'bar'")
        Process.wait pid
        status = $?
        assert_predicate(status, :exited?)
        assert_predicate(status, :success?)
        assert_equal(%["foo 'bar'"\n], File.read("out"), '[ruby-core:22960]')
        pid = spawn(%[#{bat.dump} "foo 'bar'"])
        Process.wait pid
        status = $?
        assert_predicate(status, :exited?)
        assert_predicate(status, :success?)
        assert_equal(%["foo 'bar'"\n], File.read("out"), '[ruby-core:22960]')
      end