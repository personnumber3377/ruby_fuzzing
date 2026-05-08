do |i|
            File.open("test_thr_kill_count", "w") {|f| f.puts i }
            queue = Thread::Queue.new
            th = Thread.start {
              queue.push(nil)
              r.read 1
            }
            queue.pop
            th.kill
            th.join
          end