do |tmp_dir|
      assert_compiles('true', <<~RUBY, extra_args: ['-C', tmp_dir, '--zjit-trace-exits'])
        def test(object) = object.itself

        # induce an exit just for good measure
        array = []
        test(array)
        test(array)
        def array.itself = :not_itself
        test(array)

        RubyVM::ZJIT.exit_locations.is_a?(Hash)
      RUBY
      dump_files = Dir.glob('zjit_exits_*.dump', base: tmp_dir)
      assert_equal(1, dump_files.length)
      refute(File.empty?(File.join(tmp_dir, dump_files.first)))
    end