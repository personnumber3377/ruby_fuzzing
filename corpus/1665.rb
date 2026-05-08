do
      class << self
        remove_method :class_method_o rescue nil
      end