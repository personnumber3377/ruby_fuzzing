dows?

  def test_exec_nonascii
    bug12841 = '[ruby-dev:49838] [Bug #12841]'

    [
      "\u{7d05 7389}",
      "zuf\u{00E4}llige_\u{017E}lu\u{0165}ou\u{010D}k\u{00FD}_\u{10D2 10D0 10DB 10D4 10DD 10E0 10D4 10D1}_\u{0440 0430 0437 043B 043E 0433 0430}_\u{548C 65B0 52A0 5761 4EE5 53CA 4E1C}",
      "c\u{1EE7}a",
    ].each do |arg|
      begin
        arg = arg.encode(Encoding.local_charmap)
      rescue
      else
        assert_in_out_err([], "#{<<-"begin;"}\n#{<<-"end