dom_generator(&block)
    class << block
      alias rand call
    end