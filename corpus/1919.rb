do |a|
      Sentence.each(syntax, *args) {|t|
        a.for(t) {yield t}
      }
    end