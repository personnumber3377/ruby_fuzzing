dom failure: ArgumentError: SyntaxError#path changed
            $stderr.puts "TestRubyLiteral#test_float failed: %p" % s
            raise
          rescue SyntaxError => e
            r2 = :err
          rescue NameError
            r2 = :err
          end