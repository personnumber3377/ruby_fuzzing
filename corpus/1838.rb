do |i|
      assert_equal(t.include?(i.chr), File.fnmatch("[#{s}]", i.chr, File::FNM_DOTMATCH))
      assert_equal(t.include?(i.chr), !File.fnmatch("[^#{s}]", i.chr, File::FNM_DOTMATCH))
      assert_equal(t.include?(i.chr), !File.fnmatch("[!#{s}]", i.chr, File::FNM_DOTMATCH))
    end