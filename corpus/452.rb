do |i|
        pid = fork {Process.kill(:QUIT, parent)}
        IO.popen([ruby, -'--disable=gems'], -'r+'){}
        Process.wait(pid)
      end