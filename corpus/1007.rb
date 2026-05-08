do
      h.each { callcc {|c2| c = c2 } }
      h.clear
      c.call
    end