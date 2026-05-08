dows
      setup_envs(%w[HOME USERPROFILE HOMEDRIVE HOMEPATH])

      ENV['HOME'] = "C:\\ruby\\home"
      assert_equal("C:/ruby/home", Dir.home)

      ENV['USERPROFILE'] = "C:\\ruby\\userprofile"
      assert_equal("C:/ruby/home", Dir.home)
      ENV.delete('HOME')
      assert_equal("C:/ruby/userprofile", Dir.home)

      ENV['HOMEDRIVE'] = "C:"
      ENV['HOMEPATH'] = "\\ruby\\homepath"
      assert_equal("C:/ruby/userprofile", Dir.home)
      ENV.delete('USERPROFILE')
      assert_equal("C:/ruby/homepath", Dir.home)
    end