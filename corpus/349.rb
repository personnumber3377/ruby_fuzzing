do |tp|
      next unless target_thread?

      event_lines << tp.lineno
      next if (__LINE__ + 2 .. __LINE__ + 4).cover?(tp.lineno)
      TracePoint.allow_reentry do
        _a = 1; _l3 = __LINE__
        _b = 2; _l4 = __LINE__
      end