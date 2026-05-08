do
      c = nil
      @obj.sort_by {|x| callcc {|c2| c ||= c2 }; x }
      c.call
    end