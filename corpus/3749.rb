dows_31J)
    path = nil
    Dir.mktmpdir do |dir|
      path = File.join(dir, base+".rb")
      assert_raise_with_message(LoadError, /#{base}/) {
        load(File.join(dir, base))
      }

      File.open(path, "w+b") do |t|
        t.puts "warn 'ok'"
      end