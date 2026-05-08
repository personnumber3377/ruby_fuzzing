do
      tp = TracePoint.new(:line){}
      tp.enable(target_thread: nil){
        tp.enable(target: code2){}
      }
    end