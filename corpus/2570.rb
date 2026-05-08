do |ivar|
        c.instance_variable_set("@i#{ivar}", "ivar-#{ivar}")
      end