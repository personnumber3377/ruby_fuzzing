does_not_rehash
    obj = Object.new
    class << obj
      attr_accessor :hash_calls
      def hash
        @hash_calls += 1
        super
      end