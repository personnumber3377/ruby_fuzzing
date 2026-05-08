do |f|
      f.puts "caller_locations(0, 1)[0].tap {|loc| puts loc.lineno}"
      f.close
      assert_in_out_err(["-C", *File.split(f.path)], "", ["1"])
    end