do |w|
      w.write_nonblock('1', exception: false)
      w.close
    end