do
      t.instance_eval <<-END, __FILE__, __LINE__+1
        a = bar "foo" do "bar" end