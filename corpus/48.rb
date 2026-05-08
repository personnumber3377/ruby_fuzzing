do
      ObjectSpace.each_object(MatchData).to_a
      "".scan(//)
      ObjectSpace.each_object(MatchData).to_a.inspect
    end