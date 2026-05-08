do |x|
      ancestors = self.ancestors
      sc_ancestors = singleton_class.ancestors
      super(x)
    end