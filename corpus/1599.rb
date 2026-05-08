do
      a = [ {c: "b"}, {c: "r"}, {c: "w"}, {c: "g"}, {c: "g"} ]
      a.sort_by!{|e| e[:c]}
      a.uniq!   {|e| e[:c]}
    end