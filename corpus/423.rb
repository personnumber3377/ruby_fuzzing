do |sig_r, sig_w|
      Signal.trap(:CHLD) do
        signal_received << true
        sig_w.write('?')
      end