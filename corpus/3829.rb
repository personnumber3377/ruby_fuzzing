do
      attr_reader :args
      class << self
        alias [] new
      end