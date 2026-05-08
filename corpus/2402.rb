do |base|
      # "test" in Japanese and N'Ko
      test = base + "/\u{30c6 30b9 30c8}_\u{7e1 7ca 7dd 7cc 7df 7cd 7eb}"
      Dir.mkdir(test)
      assert_in_out_err(["-C", base, "-C", File.basename(test), "-e", "puts Dir.pwd"]) do |r, e|
        assert_file.identical?(r.join(''), test)
        assert_equal([], e)
      end