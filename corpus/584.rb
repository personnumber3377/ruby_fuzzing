do
      main.instance_eval do
        define_method("feature6609_method", Object.instance_method(:feature6609_block))
      end