do
      tp = TracePoint.new(:line){}
      tp.enable(target: code1){
        tp.enable(target: code2){}
      }
    end