do |i|
      thr = Thread.new{
        Thread.current.report_on_exception = false
        q << i
      }
      thr[:pc] = i
      thr
    end