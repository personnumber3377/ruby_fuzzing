dout = $stdout
    argf = ARGF.class.new(name)
    argf.inplace_mode = suffix.encode(Encoding::UTF_16LE)
    begin
      argf.each do |s|
        puts "+"+s
      end