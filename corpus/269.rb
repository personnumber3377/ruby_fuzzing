self", b)
    }

    set_trace_func(func)
    assert_equal(self, ok, bug3921)
  end

  class << self
    define_method(:method_added, Module.method(:method_added))
  end

  def trace_by_tracepoint *trace_events
    events = []
    trace = nil
    xyzzy = nil
    _local_var = :outer
    raised_exc = nil
    method = :trace_by_tracepoint
    _get_data = lambda{|tp|
      case tp.event
      when :return, :c_return
        tp.return_value
      when :raise
        tp.raised_exception
      else
        :nothing
      end
    }
    _defined_class = lambda{|tp|
      klass = tp.defined_class
      begin
        # If it is singleton method, then return original class
        # to make compatible with set_trace_func().
        # This is very ad-hoc hack. I hope I can make more clean test on it.
        case klass.inspect
        when /Class:TracePoint/; return TracePoint
        when /Class:Exception/; return Exception
        else klass
        end
      rescue Exception => e
        e
      end if klass
    }

    trace = nil
    begin
    eval <<-EOF.gsub(/^.*?: /, "