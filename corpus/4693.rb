do |f|
        a = [f.getc, f.getc, f.getc]
        a.reverse_each {|c| f.ungetc c }
        assert_raise(IOError) { f.sysread(1) }
      end