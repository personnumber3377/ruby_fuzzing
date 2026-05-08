do |obj|
      assert_equal(13, obj.instance_eval("@@cvar"))
      assert_equal(13, obj.instance_eval{@@cvar})
      # assert_raise(NameError){obj.instance_eval("@@cvar")}
      # assert_raise(NameError){obj.instance_eval{@@cvar}}
    end