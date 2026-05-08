do
      eval("#{name} = nil; Ractor.shareable_proc{#{name} = nil}")
    end