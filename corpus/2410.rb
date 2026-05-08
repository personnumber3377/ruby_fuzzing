do |path|
      name = "test_rubyoption.rb"
      parent, dir = File.split(path)
      File.write("#{path}/#{name}", "p 1")
      load_error = %r[#{Regexp.quote dir}/#{Regexp.quote name} \(LoadError\)]

      ENV['PATH'] = [path, *libpath].join(File::PATH_SEPARATOR)
      assert_in_out_err(%w(-S) + [name], "", %w(1), [])
      ENV['PATH'] = [parent, *libpath].join(File::PATH_SEPARATOR)
      assert_in_out_err(%W(-S) + ["#{dir}/#{name}"], "", [], load_error)
      ENV['PATH'] = path_orig

      ENV['RUBYPATH'] = path
      assert_in_out_err(%w(-S) + [name], "", %w(1), [])
      ENV['RUBYPATH'] = parent
      assert_in_out_err(%w(-S) + ["#{dir}/#{name}"], "", [], load_error)
    ensure
      ENV['RUBYPATH'] = rubypath_orig
      ENV['PATH'] = path_orig
    end