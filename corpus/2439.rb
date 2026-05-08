do |s|
        s = s.encode(locale) rescue next
        assert_e_script_encoding(s)
        assert_e_script_encoding(s, %W[-E#{locale.name}])
      end