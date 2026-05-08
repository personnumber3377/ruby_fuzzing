do |tmpdir|
      main_file = File.join(tmpdir, 'main.rb')
      module_file = File.join(tmpdir, 'test_module.rb')

      File.write(module_file, <<-RUBY)
        module AutoloadRelativeTest
          VERSION = '1.0'
        end