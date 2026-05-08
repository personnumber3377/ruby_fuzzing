do
      eval("#{name} = :#{name}; Proc.new {p #{name}}").isolate
    end