do |i|
      callcc {|c| cont = c} if !cont and i == 10
      false
    end