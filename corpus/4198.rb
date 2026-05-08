do
        def coerce(num) = [self.class.new(num), self]
        def +(other) = self.class.new(val + other.val)
        def <=>(other) = other.is_a?(self.class) ? val <=> other.val : val <=> other
      end