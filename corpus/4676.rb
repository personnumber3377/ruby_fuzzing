do |w|
      w.binmode
      w.puts "foo"
      w.puts "bar"
      w.puts "baz"
      w.close
    end