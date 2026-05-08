do |f, s|
      File.write(f.path, s, mode: "w:utf-8")
    end