do
        obj = Object.new
        class << obj
          include Enumerable
          def each
            yield 1
          end