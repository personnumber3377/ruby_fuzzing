do |line|
        if name = line[/^class\s+(\S+)/, 1]
          lineno = f.lineno
          true
        end