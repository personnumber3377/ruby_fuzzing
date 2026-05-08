do |svr|
      con = TCPSocket.new('localhost', svr.addr[1])
      acc = svr.accept
      assert_equal str.length, con.send