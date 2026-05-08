do
      Module.new.module_eval {define_method(:foo, Base.instance_method(:foo))}
    end