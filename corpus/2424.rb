do |status, message = "", out = ""|
      if (sig = status.termsig) && Signal.list["SEGV"] == sig
        out = ""
      end