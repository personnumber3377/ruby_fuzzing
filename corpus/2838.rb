do |tmpdir|
      path = File.join(tmpdir, "foo")
      test = lambda do |newline|
        File.open(path, "wt", newline: newline) do |f|
          f.write "a\n"
          f.puts "b"
        end