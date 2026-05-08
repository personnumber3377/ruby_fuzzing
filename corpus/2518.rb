do |path|
      called_with << path
      old_require path
    end