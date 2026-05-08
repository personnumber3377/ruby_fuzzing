do
      overlaid = proc do |obj|
        def obj.reverse
          super
        end