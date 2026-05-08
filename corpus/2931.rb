do
      buf.locked { raise Bug21882 }
    end