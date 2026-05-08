dopen
        Bug::File::NewlineConv.rb_io_fdopen(filename, read_or_write, binary_or_text)
      else
        raise "Don't know how to open with #{method}"
      end