do
      fionread = 0x541B
      File.open(__FILE__){|f1|
        f1.ioctl(fionread, buf)
      }
    end