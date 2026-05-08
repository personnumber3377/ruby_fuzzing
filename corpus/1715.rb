do |f|
      f.flock(File::LOCK_EX)
      assert_separately(["-rtimeout", "-", regular_file, timeout], "#{<<-"begin;"}\n#{<<-'end