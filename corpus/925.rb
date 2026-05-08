do
      class_eval('def rescued(x) = raise "to be caught" rescue "instance #{x}"')
      class_eval('def self.rescued(x) = raise "to be caught" rescue "class #{x}"')
    end