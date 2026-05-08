do
      TracePoint.new(:line){}.enable(target_line: 10){}
    end