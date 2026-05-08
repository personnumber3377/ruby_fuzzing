do |debug_lines|
      Encoding.list.each do |enc|
        next unless enc.ascii_compatible?
        make_tmpsrc(f, "# -*- coding: #{enc.name} -*-\n#----------------")
        load(f.path)
        assert_equal([f.path], debug_lines.keys)
        assert_equal([enc, enc], debug_lines[f.path].map(&:encoding), bug4361)
      end