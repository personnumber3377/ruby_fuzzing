do
      class << self
        remove_method :class_method_c rescue nil
      end