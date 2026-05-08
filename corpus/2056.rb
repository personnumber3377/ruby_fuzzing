dout.chomp, out.chomp if stdout

    unless ANY.equal?(result)
      assert_equal result, stats[:result]
    end