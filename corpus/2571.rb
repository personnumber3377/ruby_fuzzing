do |ivar|
        assert_equal "ivar-#{ivar}", c.instance_variable_get("@i#{ivar}")
      end