do
      b1 = eval("proc {|i| i if 2..4}")
      b2 = eval("proc {|i| if 2..4; i; end