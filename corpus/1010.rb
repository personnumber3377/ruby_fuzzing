do
      h = @cls[1=>2,3=>4]
      c = nil
      f = false
      h.each { |i|
        callcc {|c2| c = c2 } unless c
        h.delete(1) if f
      }
      unless f
        f = true
        c.call
      end