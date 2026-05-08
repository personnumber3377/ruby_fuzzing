do |mode|
        open(t.path, "w#{mode}") do |f|
          f.write "0123456789\n"
        end