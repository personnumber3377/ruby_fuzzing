do
            TracePoint.new(:line) {
              # all these allocations shouldn't GC these tracepoints while the ractor is alive.
              Object.new
            }.enable
          end