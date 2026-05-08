do
      case method_proc
      when nil
        yield
      when Symbol
        method(method_proc).call(*args)
      else
        method_proc.call(*args)
      end