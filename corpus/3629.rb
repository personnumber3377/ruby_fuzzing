down
    $VERBOSE = @verbose
    ENV.clear
    @backup.each {|k, v| ENV[k] = v }
  end