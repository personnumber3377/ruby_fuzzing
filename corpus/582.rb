do
      define_method(:foo) {|&block|
        block.call if block
      }
    end