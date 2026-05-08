do |subclass|
      assert_equal Object, subclass.superclass, "Expected #{subclass}.superclass to be Object"
    end