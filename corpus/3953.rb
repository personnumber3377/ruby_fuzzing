dom.hex}", 1)

    8.times do |i|
      @obj.instance_variable_set("@TestObjectIdTooComplexClass#{i}", 1)
      @obj.remove_instance_variable("@TestObjectIdTooComplexClass#{i}")
    end