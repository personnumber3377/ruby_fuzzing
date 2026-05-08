do |tmpdir|
      autoload_path = File.join(tmpdir, "test-bug-15790.rb")
      File.write(autoload_path, '')

      assert_separately(%W[-I #{tmpdir}], <<-RUBY)
        $VERBOSE = nil
        path = #{File.realpath(autoload_path).inspect}
        autoload :X, path
        assert_equal(path, Object.autoload?(:X))

        assert_raise(NameError){X}
        assert_nil(Object.autoload?(:X))
        assert_equal(false, Object.const_defined?(:X))

        $LOADED_FEATURES.delete(path)
        assert_equal(false, Object.const_defined?(:X))
        assert_nil(Object.autoload?(:X))

        assert_raise(NameError){X}
        assert_equal(false, Object.const_defined?(:X))
        assert_nil(Object.autoload?(:X))
      RUBY
    end