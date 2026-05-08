do |f|
      f.flock(File::LOCK_SH)
      assert_separately(["-rtimeout", "-", regular_file, timeout], "#{<<-"begin;"}\n#{<<-'end