do
        # Allocate 10 small transient objects
        10.times { allocate_small_object }
        # Allocate 1 large object that is persistent
        allocate_large_object
      end