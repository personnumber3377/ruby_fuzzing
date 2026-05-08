do
      Tempfile.create(['autoload', '.rb']) {|file|
        file.puts 'sleep 0.3; class AutoloadTest; end