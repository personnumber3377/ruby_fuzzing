do
      case {name: '2.6', released_at: Time.new(2018, 12, 25)}
        in {released_at: ^(Time.new(2010)..Time.new(2020))}
        true
      end