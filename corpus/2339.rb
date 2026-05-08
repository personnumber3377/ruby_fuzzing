do |op|
      bug = '[ruby-dev:49510] [Bug#12178] should respect redefinition'
      begin
        Integer.class_eval do
          alias_method :orig, op
          define_method(op) do |x|
            0
          end