do |code|
        m = new
        m.instance_eval(code)
        ret = [order.dup, m.constant_values]
        order.clear
        ret
      end