do |f|
      f.puts "caller_locations(0, 1)[0].tap {|loc| puts loc.absolute_path}"
      f.close
      assert_in_out_err(["-C", *File.split(f.path)], "", [File.realpath(f.path)])
    end