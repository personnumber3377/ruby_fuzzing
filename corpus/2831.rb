do |tmpdir|
      file = File.join(tmpdir, "\u3042")
      File.open(file, 'w'){}
      assert_equal(File.chmod(0666, file), 1, bug5671)
    end