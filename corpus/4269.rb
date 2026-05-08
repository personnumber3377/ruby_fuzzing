do
      require "objspace"

      old_obj = Object.new
      4.times { GC.start }

      assert_include ObjectSpace.dump(old_obj), '"old":true'

      young_obj = Object.new
      old_obj.instance_variable_set(:@test, young_obj)

      # Not immediately promoted to old generation
      3.times do
        assert_not_include ObjectSpace.dump(young_obj), '"old":true'
        GC.start
      end