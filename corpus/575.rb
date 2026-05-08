do |obj|
      assert_equal(13, obj.instance_exec{@@cvar})
    end