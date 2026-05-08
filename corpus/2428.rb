do |script|
      Tempfile.create("crash_report") do |crash_report|
        script.write(<<~BASH)
          #!/usr/bin/env bash

          cat > #{crash_report.path}
        BASH
        script.close

        FileUtils.chmod("+x", script)

        assert_crash_report("| #{script.path}") do
          assert_include(File.read(crash_report.path), "[BUG] Segmentation fault at")
        end