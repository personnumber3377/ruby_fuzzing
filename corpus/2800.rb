do
      1.instance_eval do
        alias to_string to_s
      end