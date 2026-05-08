do |tmpdir|
      nested_dir = File.join(tmpdir, 'nested')
      Dir.mkdir(nested_dir)

      main_file = File.join(tmpdir, 'nested_test.rb')
      module_file = File.join(nested_dir, 'deep_module.rb')

      File.write(module_file, 'module DeepModule; VALUE = 42; end