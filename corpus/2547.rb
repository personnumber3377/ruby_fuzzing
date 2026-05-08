do |tmpdir|
      autoload_path = File.join(tmpdir, "some_const.rb")
      File.write(autoload_path, 'class SomeConst; end