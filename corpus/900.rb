do
        eval(str)
        raise "unreachable"
      rescue SyntaxError
      end