do
      def bar_post(*a, x) = nil
      define_method(:bar_post_bmethod) { |*a, x| }
    end