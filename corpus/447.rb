do
      [
       "\u{7d05 7389}",
       "zuf\u{00E4}llige_\u{017E}lu\u{0165}ou\u{010D}k\u{00FD}_\u{10D2 10D0 10DB 10D4 10DD 10E0 10D4 10D1}_\u{0440 0430 0437 043B 043E 0433 0430}_\u{548C 65B0 52A0 5761 4EE5 53CA 4E1C}",
       "c\u{1EE7}a",
      ].each do |name|
        msg = "#{bug1771} #{name}"
        exename = "./#{name}.exe"
        FileUtils.cp(ENV["COMSPEC"], exename)
        assert_equal(true, system("#{exename} /c exit"), msg)
        system("#{exename} /c exit 12")
        assert_equal(12, $?.exitstatus, msg)
        _, status = Process.wait2(Process.spawn("#{exename} /c exit 42"))
        assert_equal(42, status.exitstatus, msg)
        assert_equal("ok\n", `#{exename} /c echo ok`, msg)
        assert_equal("ok\n", IO.popen("#{exename} /c echo ok", &:read), msg)
        assert_equal("ok\n", IO.popen(%W"#{exename} /c echo ok", &:read), msg)
        File.binwrite("#{name}.txt", "ok")
        assert_equal("ok", `type #{name}.txt`)
      end