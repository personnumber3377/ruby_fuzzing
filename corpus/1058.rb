do
      instance_exec([1,2,3], &->(a=[]){ a })
    end