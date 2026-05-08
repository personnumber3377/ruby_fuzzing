do |tmpdir|
      path = File.join(tmpdir, "foo")
      assert_raise(ArgumentError) do
        open(path + "\0bar", "w") {}
      end