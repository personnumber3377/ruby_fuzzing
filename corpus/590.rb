do
        eval("/[/=~s")
      rescue SyntaxError
      else
        raise "Expected SyntaxError to be raised"
      end