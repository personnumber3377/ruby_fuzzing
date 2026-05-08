do
        threads << Thread.new do
          ractor_job(JOBS_PER_THREAD, ARRAY_SIZE)
        end