do |path,|
        # drop strings not created in this file
        # (the parallel testing framework may create strings in a separate thread)
        path == __FILE__
      end