do
      eval("#{name} = []; Ractor.shareable_proc{#{name}}")
    end