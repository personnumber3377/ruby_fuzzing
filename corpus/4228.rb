do |instance|
        [
          ObjectSpace.allocation_sourcefile(instance),
          ObjectSpace.allocation_sourceline(instance),
          instance.class,
          instance,
        ]
      end