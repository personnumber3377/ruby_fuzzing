do |t|
      path = File.realpath(t.path)
      basename = File.basename(path)
      t.puts "require '#{basename}'"
      t.close
      $LOAD_PATH.push(File.dirname(t))
      warning = capture_warning_warn {
        assert require(basename)
      }
    ensure
      $LOAD_PATH.pop
      $LOADED_FEATURES.delete(t.path)
    end