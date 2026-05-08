do |tp0|
      tp_multi1 = TracePoint.new(:return, :b_return, :line) do |tp|
        tp0.disable
      end