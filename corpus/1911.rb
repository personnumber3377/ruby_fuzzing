do |dir|
      lib = File.join(dir, "syntax_error-path.rb")
      File.write(lib, "#{<<~"begin;"}\n#{<<~'end