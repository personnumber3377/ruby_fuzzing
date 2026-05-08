do |tmpdir|
      autoload_path = File.join(tmpdir, "autoload_module_gc.rb")
      File.write(autoload_path, "X = 1; Y = 2;")

      x = Module.new
      x.autoload :X, "./feature.rb"

      1000.times do
        y = Module.new
        y.autoload :Y, "./feature.rb"
      end