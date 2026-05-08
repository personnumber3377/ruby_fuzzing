do
        # shareable_constant_value: literal
        ::B = Class.new
        ::B::C ||= ["Not " + "shareable"]
      end