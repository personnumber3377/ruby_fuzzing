dows
    def windows_version
      @windows_version ||= %x[ver][/Version (\d+)/, 1].to_i
    end