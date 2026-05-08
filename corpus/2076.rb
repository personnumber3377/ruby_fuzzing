do
      IO.popen(args) do |child|
        signame = Marshal.load(child)
        assert_equal("INT", signame)
      end