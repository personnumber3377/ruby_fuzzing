dopen(t.fileno, false)
    begin
      w.close
      t.close
      omit "expect IO object was GC'ed but not recycled yet"
    rescue WeakRef::RefError
      assert_nothing_raised(Errno::EBADF, feature2250) {t.close}
    end