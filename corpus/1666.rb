do
      class << self
        remove_method :class_method_m rescue nil
      end