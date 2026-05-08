do
      dst_class = Class.new do
        def initialize(&block)
          @block = block
        end