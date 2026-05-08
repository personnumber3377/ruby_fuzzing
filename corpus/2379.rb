do |n|
        obj = Class.new.new
        n.times { |i| obj.instance_variable_set("@foo" + i.to_s, 0) }
        $objects << obj
      end