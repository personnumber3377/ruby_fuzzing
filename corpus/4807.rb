do |r, w|
        trap(:INT) do
          w.puts "INT"
        end