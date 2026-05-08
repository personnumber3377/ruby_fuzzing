do
      tp2.enable(target: code1, target_line: line_0 + 4) do
        # two hooks
        code1.call
      end