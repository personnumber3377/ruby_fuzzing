do
      define_method(:singleton_method_added) {|mid| added << [self, mid]}
      def foo; :foo; end