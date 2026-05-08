do
      testdir = "\u30c6\u30b9\u30c8"
      Dir.mkdir(testdir)
      Dir.chdir(testdir) do
        open("test.rb", "w") do |f|
          f.puts <<-END
            if __FILE__.encoding == __dir__.encoding
              p true
            else
              puts "__FILE__: \#{__FILE__.encoding}, __dir__: \#{__dir__.encoding}"
            end