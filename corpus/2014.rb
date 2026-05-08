do
      open("FileWithCases", "w") {}
      return unless File.exist?("filewithcases")
      assert_equal(%w"FileWithCases", Dir.glob("filewithcases"), feature5994)
    end