dows
      unless /mswin|mingw|darwin/ =~ RUBY_PLATFORM
        assert_separately(%W[-EUTF-8], <<-'EOS', :chdir=>d)
          filename1 = "\xc2\xa1".dup.force_encoding("utf-8")
          filename2 = "\xc2\xa1".dup.force_encoding("euc-jp")
          filename3 = filename1.encode("euc-jp")
          filename4 = filename2.encode("utf-8")
          assert_file.stat(filename1)
          assert_file.stat(filename2)
          assert_file.not_exist?(filename3)
          assert_file.not_exist?(filename4)
        EOS
      end