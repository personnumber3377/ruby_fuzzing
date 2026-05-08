do
      m = /foo-([A-Za-z0-9_\.]+)-baz/.match(str)
      assert_equal("bar", m[1], bug17507)

      # These two lines are needed to trigger the bug
      File.exist? "/tmp"
      str.gsub(/foo-bar-baz/, "foo-abc-baz")
    end