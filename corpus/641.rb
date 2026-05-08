do |priv|
      <<-"CODE"
      fin = Object.new
      class << fin
        #{priv}def call(id)
          puts "finalized"
        end