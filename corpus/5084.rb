do |path|
      assert_raise_with_message(Errno::ENOENT, /- #{Regexp.quote(path)}\z/) {argf.gets}
    end