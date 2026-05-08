do
          IO.popen("-") do |f|
            break f.readlines.map(&:chomp) if f
            th = Thread.start {sleep 3}
            Process.daemon(true, true)
            puts Thread.list.size, th.status.inspect
          end