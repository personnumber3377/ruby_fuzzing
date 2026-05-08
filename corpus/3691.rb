do |port|
        bug12475 = '[ruby-dev:49655] [Bug #12475]'
        n = [*"0".."9"].join("")*3
        e0 = ENV[n0 = "E\#{n}"]
        e1 = ENV[n1 = "E\#{n}."]
        ENV[n0] = nil
        ENV[n1] = nil
        ENV[n1.chop] = "T\#{n}.".chop
        ENV[n0], e0 = e0, ENV[n0]
        ENV[n1], e1 = e1, ENV[n1]
        port.send