do
      assert_equal(%w"a/FileWithCases", Dir.glob("A/filewithcases"), feature5994)
    end