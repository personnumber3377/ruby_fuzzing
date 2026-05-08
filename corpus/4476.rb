do
      list = %W"file_one.ext file_two.ext \u{6587 4ef6}1.txt \u{6587 4ef6}2.txt"
      list.each {|f| File.binwrite(f, "")}
      a = "file_one*".dup.force_encoding Encoding::IBM437
      b = "file_two*".dup.force_encoding Encoding::EUC_JP
      assert_equal([a, b].map(&:encoding), Dir[a, b].map(&:encoding))
      if Bug::File::Fs.fsname(Dir.pwd) == "apfs"
        # High Sierra's APFS cannot use filenames with undefined character
        dir = "\u{76EE}"
      else
        dir = "\u{76EE 5F551}"
      end