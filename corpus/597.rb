do |tmpdir|
      autoload_path = File.join(tmpdir, 'test_getconstant_path_autoload.rb')
      File.write(autoload_path, 'X = RUBY_COPYRIGHT')

      assert_compiles RUBY_COPYRIGHT.dump, %Q{
        Object.autoload(:X, #{File.realpath(autoload_path).inspect})
        def test = X
        test
      }, call_threshold: 1, insns: [:opt_getconstant_path]
    end