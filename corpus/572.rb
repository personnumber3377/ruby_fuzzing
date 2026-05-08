do |obj|
      obj.instance_variable_set :@ivar, 12 unless obj.frozen?
      yield obj
    end