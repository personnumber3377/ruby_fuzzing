do
      File.open('/dev/urandom'){|f1|
        entropy_count = ""
        # RNDGETENTCNT(0x80045200) mean "get entropy count".
        f1.ioctl(0x80045200, entropy_count)
      }
    end