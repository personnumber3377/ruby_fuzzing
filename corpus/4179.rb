do |code|
      a = eval("#-*- coding: utf-8 -*-\n#{code}")
      assert_equal(Encoding::UTF_8, a.encoding,
                   proc{"#{bug11519}: #{code}.encoding"})
    end