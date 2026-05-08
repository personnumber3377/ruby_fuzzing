do |opt, exp|
        a.for("#{opt}=>#{exp}") do
          assert_in_out_err(["-w", "--disable=gems", "--#{opt}=frozen-string-literal"], <<-"end