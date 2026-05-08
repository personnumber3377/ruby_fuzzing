do
      max = case from
            when Float then 65
            when Integer then Math.log(to-from+(range.exclude_end