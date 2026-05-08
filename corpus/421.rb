do
        pr = Process.getpriority(Process::PRIO_PROCESS, $$)
        Process.setpriority(Process::PRIO_PROCESS, $$, pr)
      end