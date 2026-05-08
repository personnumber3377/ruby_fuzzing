do |tmpdir|
      main_file = File.join(tmpdir, 'query_test.rb')
      module_file = File.join(tmpdir, 'query_module.rb')

      File.write(module_file, 'module QueryModule; end