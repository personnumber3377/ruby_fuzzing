doNode
      assert_prism_eval(<<-CODE)
        counter = 0

        5.times do |i|
          counter += 1
          if i == 2 && counter < 3
            redo
          end