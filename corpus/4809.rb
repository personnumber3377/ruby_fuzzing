don't support interrupting `gets`.
      ensure
        thread&.join
      end