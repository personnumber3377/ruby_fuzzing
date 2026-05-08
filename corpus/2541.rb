do |i|
        m = Module.new
        m.instance_eval do
          autoload :Foo, 'x'
          autoload :Bar, i.to_s
        end