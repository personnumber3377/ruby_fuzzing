dows_31J,
      Encoding::GB18030,
    ].each do |e|
      EnvUtil.with_default_external(e) do
        str = "\x81\x30\x81\x30".force_encoding('GB18030')
        assert_equal(Encoding::GB18030 == e ? %{"#{str}"} : '"\x{81308130}"', str.inspect)
        str = e("\xa1\x8f\xa1\xa1")
        expected = "\"\\xA1\x8F\xA1\xA1\"".force_encoding("EUC-JP")
        assert_equal(Encoding::EUC_JP == e ? expected : "\"\\xA1\\x{8FA1A1}\"", str.inspect)
        str = s("\x81@")
        assert_equal(Encoding::Windows_31J == e ? %{"#{str}"} : '"\x{8140}"', str.inspect)
        str = "\u3042\u{10FFFD}"
        assert_equal(Encoding::UTF_8 == e ? %{"#{str}"} : '"\u3042\u{10FFFD}"', str.inspect)
      end