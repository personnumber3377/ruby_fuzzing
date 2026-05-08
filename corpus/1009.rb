do
      h=@cls[]
      cnt=0
      c = callcc {|cc|cc}
      h[cnt] = true
      h.each{|i|
        cnt+=1
        c.call if cnt == 1
      }
    end