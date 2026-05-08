do |w|
      w.print('a')
      EnvUtil.suppress_warning {w.print('a','b','c')}
      w.close
    end