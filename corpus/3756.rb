do
            begin
              tap {tap {tap {load(ARGV[0])}}}
            rescue LoadError
              GC.start
              retry
            end