do |d|
      File.write("#{d}/2.rb", "")
      File.write("#{d}/1.rb", "require_relative '2'\n""__FILE__\n")
      file = "1.rb"
      path = File.expand_path(file, d)
      assert_equal(path, eval(File.read(path), nil, File.expand_path(file, d)))
      assert_equal(path, eval(File.read(path), nil, File.expand_path(file, d)))
    end