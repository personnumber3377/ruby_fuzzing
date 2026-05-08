do inplace edit without backup/, e.join) #'
      else
        assert_equal([], e)
        assert_equal([], r)
        assert_equal("foo.new\nbar.new\nbaz.new\n", File.read(t.path))
      end