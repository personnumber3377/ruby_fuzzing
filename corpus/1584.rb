do
      a = [1, 2, 3, 4]
      c << a.dup

      begin
        a.reject! do |x|
          case x
          when 2 then true
          when 3 then raise StandardError, 'Oops'
          else false
          end