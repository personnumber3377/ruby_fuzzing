do |s|
      s.gsub(/(verify_internal_consistency_reachable_i:\sWB\smiss\s\S+\s\(T_ARRAY\)\s->\s)\S+\s\((proc|T_NONE)\)\n
             \K(?:\1\S+\s\(\2\)\n)*/x) do
        "...(snip #{$&.count("\n")} lines)...\n"
      end