do
        Ractor.new do
          inner_results = 0
          tp = TracePoint.new(:call) do
             inner_results += 1
          end