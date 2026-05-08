do
    remove_const :A7 if defined? TestRubyPrimitive::A7

    class A7
      @@c = 1
      def m
        @@c += 1
      end