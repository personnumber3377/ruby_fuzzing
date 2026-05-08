do |i|
        ret = run_in_child(<<-INPUT)
          begin
            $VERBOSE = nil
            Process.exec('#{cmd}', 'dummy', #{i} => :close)
          rescue SystemCallError
          end