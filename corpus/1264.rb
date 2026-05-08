do
    remove_const :A8 if defined? TestRubyPrimitive::A8

    class A9
      @@c = 1
      def self.m
        @@c += 1
      end