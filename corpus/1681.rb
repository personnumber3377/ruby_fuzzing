do |file|
      t1 = File.atime(file)
      t2 = File.open(file) {|f| f.atime}
      assert_kind_of(Time, t1)
      assert_kind_of(Time, t2)
      # High Sierra's APFS can handle nano-sec precise.
      # t1 value is difference from t2 on APFS.
      if Bug::File::Fs.fsname(Dir.tmpdir) == "apfs"
        assert_equal(t1.to_i, t2.to_i)
      else
        assert_equal(t1, t2)
      end