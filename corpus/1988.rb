down
    $VERBOSE = @verbose
    FileUtils.remove_entry_secure @root if File.directory?(@root)
    ENV.update(@envs) if @envs
  end