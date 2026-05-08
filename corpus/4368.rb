dows_31j
    begin
      Regexp.new("\xa1".force_encoding("windows-31j")) =~ "\xa1\xa1".force_encoding("euc-jp")
    rescue Encoding::CompatibilityError
      err = $!
    end