do
      o.instance_eval <<-END, __FILE__, __LINE__+1
        a = foo 1 do 42 end