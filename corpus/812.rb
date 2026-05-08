doc(expect, result, mesg = "")
    all_assertions(mesg) do |a|
      %w[eos "eos" 'eos' `eos`].each do |eos|
        a.for(eos) do
          assert_equal(eval("<<-#{eos}\n#{expect}eos\n"),
                       eval("<<~#{eos}\n#{result}eos\n"))
        end