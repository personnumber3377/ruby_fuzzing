do |w|
           w.binmode
           w.puts(0x010a.chr(Encoding::UTF_32BE))
           w.puts(0x010a.chr(Encoding::UTF_16BE))
           w.puts(0x0a01.chr(Encoding::UTF_32LE))
           w.puts(0x0a01.chr(Encoding::UTF_16LE))
           w.close
         end