down = 10.downto(1)
      up.zip(down) {|a, b| a + b == 11 or fail 'oops'}
    }, bug13875
  end