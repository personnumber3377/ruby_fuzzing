do |d|
      names = %W"\u{391 392 393 394 395} \u{3042 3044 3046 3048 304a}"
      names.each do |dir|
        EnvUtil.with_default_external(Encoding::UTF_8) do
          Dir.mkdir(dir) rescue next
          begin
            yield(dir)
          ensure
            File.chmod(0700, dir)
          end