do |w|
      threads = []
      100.times do
        threads << Thread.new { w.puts "hey" }
      end