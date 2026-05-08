do |uid, user|
      if user
        assert_nothing_raised(feature6975) do
          begin
            system(*TRUECOMMAND, uid: user, exception: true)
          rescue Errno::EPERM, Errno::EACCES, NotImplementedError
          end