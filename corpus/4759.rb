do |i|
          threads << Thread.new {write_file.print(i)}
          threads << Thread.new {read_file.read}
        end