do
      File::Stat.new(fn1).instance_eval { initialize_copy(0) }
    end