dout = $stdout
    argf = ARGF.class.new(Struct.new(:to_path).new(name))
    begin
      result = argf.gets
    ensure
      $stdout = stdout
      argf.close
    end