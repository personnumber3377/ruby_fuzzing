do
      klass.method_defined?(mid, *args) or
        raise Test::Unit::AssertionFailedError, message, caller(3)
    end