dout_filter: ->(s) {pid = s}}
    if windows?
      opt[:new_pgroup] = true
    else
      opt[:pgroup] = true
    end