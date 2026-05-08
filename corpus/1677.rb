do not want #to_path
    io = IO.for_fd(IO.sysopen(file_name))
    yield io
  ensure
    io&.close
  end