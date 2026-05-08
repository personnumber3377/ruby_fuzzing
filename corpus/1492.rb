do |f|
        f.seek(pos)
        yield f
      end