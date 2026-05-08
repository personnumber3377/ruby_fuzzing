do
        Ractor.new do
          called = 0
          TracePoint.new(:call) do |tp|
            next if tp.callee_id != :foo
            called += 1
          end