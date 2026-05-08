do
      define_method(:==) {|x| a.clear; false }
    end