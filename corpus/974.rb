do
      Thread.new do
        count = 0
        while e = q.pop
          i, st = e
          count += 1 if i.is_a?(Integer) && st.is_a?(String)
        end