do |tmpdir|
      autoload_path = File.join(tmpdir, "autoload_parallel_race.rb")
      File.write(autoload_path, 'module Foo; end