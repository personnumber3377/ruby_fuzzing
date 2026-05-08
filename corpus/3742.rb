do |tmp|
      File.write("#{tmp}/1.rb", "require_relative '2'\n")
      File.write("#{tmp}/2.rb", "class Foo\n""end