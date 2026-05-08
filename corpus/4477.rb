doc:
    '[' << ary.map {|str| "#{str.dump}(#{str.encoding})"}.join(', ') << ']'
  end