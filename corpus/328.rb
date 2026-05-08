do
      TracePoint.new(:call){}.enable(target: code1, target_line: 10){}
    end