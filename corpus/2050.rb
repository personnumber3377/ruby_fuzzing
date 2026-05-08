do |iv| # Need to be more than MAX_IVAR
        Child.instance_variable_set("@_iv_\#{iv}", Object.new)
      end