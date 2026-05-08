do
      results = []
      tp = TracePoint.new(:line) { |tp| results << tp.path }
      tp.enable
      Ractor.main << :continue
      Ractor.receive
      tp.disable
      results
    end