do |i|
  Thread.start do
    sleep((rand(n) + 1) / 100.0)
    print "#{i}: done\n"
    lb.sync
    print "#{i}: cont\n"
  end