do |c|
        file = regular_file + c
        full_path = File.expand_path(file)
        mesg = proc {File.basename(full_path).dump}
        begin
          open(file) {}
        rescue
          # High Sierra's APFS cannot use filenames with undefined character
          next if Bug::File::Fs.fsname(Dir.tmpdir) == "apfs"
          assert_equal(file, full_path, mesg)
        else
          assert_equal(regular_file, full_path, mesg)
        end