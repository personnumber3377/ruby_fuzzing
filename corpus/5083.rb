do
      t = Tempfile.new("bug4274-")
      path = t.path
      t.close!
      path
    end