do |i|
        v = rand(2_000)
        name = "n#{v}"
        value = Object.new
        b.local_variable_set name, value
      end