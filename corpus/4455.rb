does not call #to_s anymore
    feature6130 = '[ruby-core:43238]'
    x = Object.new
    def x.to_s
      "to_s"
    end