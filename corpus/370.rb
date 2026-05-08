do
        Ractor.new(mname, klass) do |mname, klass0|
          inner_results = 0
          tp = TracePoint.new(:call) { |tp| inner_results += 1 }
          target = klass0.instance_method(mname)
          tp.enable(target: target)
          obj = klass0.new
          10.times { obj.send