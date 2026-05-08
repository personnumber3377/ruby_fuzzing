do |n|
        a **= 3
        b **= 3
        trace.clear
        th = Thread.new do
          sleep 0.1; Process.kill :INT, $$
          sleep 0.1; Process.kill :INT, $$
        end