do
      [1, 2, 3].lazy.map(&:undefined).map(&:to_s).force
    end