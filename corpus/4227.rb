do
      GC.start
      generation = GC.count

      ObjectSpace.trace_object_allocations do
        yield

        ObjectSpace.each_object(klass) do |instance|
          allocations << instance if ObjectSpace.allocation_generation(instance) == generation
        end