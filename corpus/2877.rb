do |f|
      f.puts "caller_locations(0, 1)[0].tap {|loc| puts loc.path}"
      f.close
      dir, base = File.split(f.path)
      assert_in_out_err(["-C", dir, base], "", [base])
    end