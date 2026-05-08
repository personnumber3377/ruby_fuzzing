do
      eval <<-END, nil, __FILE__, __LINE__+1
        a = proc {|x| x + "bar" }.("foo")
        b = proc {|x| x + "bar" }::("foo")
      END
    end