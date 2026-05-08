do_assign(assign, vars)
    assign = assign.to_s
    code1 = "#{assign}; [#{vars.join(",")}]"
    assign.gsub!(/\bv\d+\b/, "o.a")
    code2 = "o=[];class << o; self end