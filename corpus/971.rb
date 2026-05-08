do |i|
      Thread.new{
        Thread.current.report_on_exception = false
        q << i
      }
    end