do
      tp2.enable(target: code1) do
        code1.call
        events << :___
      end