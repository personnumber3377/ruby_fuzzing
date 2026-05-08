do
      o.instance_eval("proc {|var = 1| var}")
    end