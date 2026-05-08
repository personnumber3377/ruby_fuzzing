do
      testdir = "\u30c6\u30b9\u30c8"
      Dir.mkdir(testdir)
      Dir.chdir(testdir) do
        File.write("a.rb", "require './b'")
        File.write("b.rb", "puts 'ok'")
        assert_ruby_status([{"RUBYLIB"=>"."}, *%w[-E cp932:utf-8 a.rb]])
      end