do |group, gid|
      assert_nothing_raised(feature6975) do
        begin
          system(*TRUECOMMAND, gid: group)
        rescue Errno::EPERM, NotImplementedError
        end