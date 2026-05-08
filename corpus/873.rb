do |all|
      formats.product(formats) do |form1, form2|
        all.for(code = "alias #{form1 % 'a'} #{form2 % 'p'}") do
          assert_valid_syntax(code)
        end