do |a|
      [["disable", "false"], ["enable", "true"]].each do |opt, exp|
        %W[frozen_string_literal frozen-string-literal].each do |arg|
          key = "#{opt}=#{arg}"
          negopt = exp == "true" ? "disable" : "enable"
          env = {"RUBYOPT"=>"--#{negopt}=#{arg}"}
          a.for(key) do
            assert_in_out_err([env, "--disable=gems", "--#{key}"], 'p("foo".frozen?)', [exp])
          end