do
        Dir.mkdir('foo')
        omit "cannot run mklink" unless system('mklink /j bar foo > nul')
        assert_equal(File.realpath('foo'), File.realpath('bar'))
      end