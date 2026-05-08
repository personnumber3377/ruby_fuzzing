do |tmp|
      req = File.join(tmp, "test.rb")
      File.write(req, ",\n")
      e = assert_raise_with_message(SyntaxError, /unexpected/) {
        yield req
      }
      assert_not_nil(bt = e.backtrace, "no backtrace")
      assert_not_empty(bt.find_all {|b| b.start_with? __FILE__}, proc {bt.inspect})
    end