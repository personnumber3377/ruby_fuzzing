do |*a|
      conflicting = /conflicting chdir during another chdir block\n^#{Regexp.quote(__FILE__)}:#{__LINE__-1}:/

      assert_empty(a)

      assert_warning(conflicting) { dir.chdir }
      assert_warning(conflicting) { root_dir.chdir }

      assert_equal(@root, Dir.pwd)

      assert_raise(RuntimeError) { Thread.new { Thread.current.report_on_exception = false; dir.chdir }.join }
      assert_raise(RuntimeError) { Thread.new { Thread.current.report_on_exception = false; dir.chdir{} }.join }

      assert_warning(conflicting) { dir.chdir }
      assert_equal(pwd, Dir.pwd)

      assert_warning(conflicting) { root_dir.chdir }
      assert_equal(@root, Dir.pwd)

      assert_warning(conflicting) { dir.chdir }

      root_dir.chdir do
        assert_equal(@root, Dir.pwd)
      end