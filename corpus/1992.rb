do
      conflicting = /conflicting chdir during another chdir block\n^#{Regexp.quote(__FILE__)}:#{__LINE__-1}:/
      assert_warning(conflicting) { Dir.chdir(pwd) }

      assert_warning(conflicting) { Dir.chdir(@root) }
      assert_equal(@root, Dir.pwd)

      assert_warning(conflicting) { Dir.chdir(pwd) }

      assert_raise(RuntimeError) { Thread.new { Thread.current.report_on_exception = false; Dir.chdir(@root) }.join }
      assert_raise(RuntimeError) { Thread.new { Thread.current.report_on_exception = false; Dir.chdir(@root) { } }.join }

      assert_warning(conflicting) { Dir.chdir(pwd) }

      assert_warning(conflicting) { Dir.chdir(@root) }
      assert_equal(@root, Dir.pwd)

      assert_warning(conflicting) { Dir.chdir(pwd) }
      Dir.chdir(@root) do
        assert_equal(@root, Dir.pwd)
      end