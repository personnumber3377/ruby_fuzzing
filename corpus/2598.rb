does not transition in capacity
      a = Class.new.new
      root_shape = RubyVM::Shape.of(a)

      assert_equal(RubyVM::Shape::SHAPE_ROOT, root_shape.type)
      initial_capacity = root_shape.capacity
      refute_equal(0, initial_capacity)

      initial_capacity.times do |i|
        a.instance_variable_set(:"@ivar#{i + 1}", i)
      end