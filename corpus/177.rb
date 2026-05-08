do
      o.instance_eval <<-END, __FILE__, __LINE__+1
        a = o.m "foo", "bar" do end