do |file|
      t1 = File.birthtime(file)
      t2 = File.open(file) {|f| f.birthtime}
      assert_kind_of(Time, t1)
      assert_kind_of(Time, t2)
      assert_equal(t1, t2)
    rescue Errno::ENOSYS, NotImplementedError
      # ignore unsupporting filesystems
    rescue Errno::EPERM
      # Docker prohibits statx syscall by the default.
      omit("statx(2) is prohibited by seccomp")
    end