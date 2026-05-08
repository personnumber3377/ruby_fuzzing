do
    undef respond_to?
    def method_missing(*args, &block)
      wrapped_object.public_send