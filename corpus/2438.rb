do
    # not chcp, or parallel test may break.
    def test_locale_codepage
      locale = Encoding.find("locale")
      list = %W"\u{c7} \u{452} \u{3066 3059 3068}"
      list.each do |s|
        assert_e_script_encoding(s, %w[-U])
      end