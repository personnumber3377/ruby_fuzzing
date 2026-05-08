do |cond|
      code = %Q{
        def my_method
          var = "there"
          if #{cond}
            var = "here"
          end