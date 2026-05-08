dows? ? "~" : "~#{user}"
      assert_nothing_raised(ArgumentError) do
        assert_equal(File.expand_path(tilde), Dir.home(user))
      end