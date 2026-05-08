do |x|
      hash = {x => bug9381}
      hash[wrapper.new(x)] != bug9381
    end