do |pre|
      ["u", %w[u{ }]].each do |open, close|
        ["?", ['"', '"']].each do |qopen, qclose|
          str = "#{qopen}\\#{pre}\\#{open}5555#{close}#{qclose}"
          assert_raise(SyntaxError, "#{bug2500} eval(#{str})") {eval(str)}

          str = "#{qopen}\\#{pre}\\#{open}\u201c#{close}#{qclose}"
          assert_raise(SyntaxError, "#{bug5262} eval(#{str})") {eval(str)}

          str = "#{qopen}\\#{pre}\\#{open}\u201c#{close}#{qclose}".encode("euc-jp")
          assert_raise(SyntaxError, "#{bug5262} eval(#{str})") {eval(str)}

          str = "#{qopen}\\#{pre}\\#{open}\u201c#{close}#{qclose}".encode("iso-8859-13")
          assert_raise(SyntaxError, "#{bug5262} eval(#{str})") {eval(str)}

          str = "#{qopen}\\#{pre}\\#{open}\xe2\x7f#{close}#{qclose}".force_encoding("utf-8")
          assert_raise(SyntaxError, "#{bug5262} eval(#{str})") {eval(str)}
        end