do |x|
    begin
      [].first(x)
    rescue ArgumentError
      true
    rescue RangeError
      false
    end