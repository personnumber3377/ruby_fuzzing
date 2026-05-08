dom.hex}", 1)

    (RubyVM::Shape::SHAPE_MAX_VARIATIONS * 2).times do |i|
      obj.instance_variable_set("@ivar#{i}", i)
    end