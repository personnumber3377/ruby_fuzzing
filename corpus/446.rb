don't allow Process::getsid(pid) when pid is in
    # different session.
    return if /openbsd|aix/ =~ RUBY_PLATFORM

    IO.popen([RUBY, "-e", <<EOS]) do|io|
	Marshal.dump(Process.getsid, STDOUT)
	newsid = Process.setsid
	Marshal.dump(newsid, STDOUT)
	STDOUT.flush
	# getsid() on MacOS X return ESRCH when target process is zombie
	# even if it is valid process id.
	sleep
EOS
      begin
        # test Process.getsid() w/o arg
        assert_equal(Marshal.load(io), Process.getsid)

        # test Process.setsid return value and Process::getsid(pid)
        assert_equal(Marshal.load(io), Process.getsid(io.pid))
      ensure
        Process.kill(:KILL, io.pid) rescue nil
        Process.wait(io.pid)
      end