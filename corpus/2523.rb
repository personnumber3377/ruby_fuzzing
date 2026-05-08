do |called_with|
      Tempfile.create(%w(a .rb)) do |a|
        Tempfile.create(%w(b .rb)) do |b|
          a.puts "require '#{b.path}'; class AutoloadTest; end