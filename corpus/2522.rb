do |called_with|
      Tempfile.create(['autoload', '.rb']) {|file|
        file.puts 'class AutoloadTest; end