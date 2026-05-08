do |tmpdir|
      main_file = File.join(tmpdir, 'main_mod.rb')
      module_file = File.join(tmpdir, 'nested_module.rb')

      File.write(module_file, <<-RUBY)
        module Container
          module NestedModule
            MSG = 'loaded'
          end