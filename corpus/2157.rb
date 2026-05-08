do
      class << self
        alias_method :n, :new
        private :new
      end