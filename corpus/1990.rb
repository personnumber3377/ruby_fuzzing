do
        pos = dir.tell
        break unless name = dir.read
        cache << [pos, name]
      end