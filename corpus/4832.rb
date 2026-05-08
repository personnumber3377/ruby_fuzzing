do
      klass.method_defined?(mid, *args) and
        raise Test::Unit::AssertionFailedError, message, caller(3)
    end