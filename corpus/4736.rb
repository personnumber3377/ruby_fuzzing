do
          io = open(path,"w")
          io.instance_variable_set(:@test_flush_in_finalizer2, true)
          io.print "hoge"
        end