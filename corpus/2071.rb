do |signm, signo|
      next if signm == "EXIT"
      assert_equal(signo, SignalException.new(signm).signo, signm)
      assert_equal(signo, SignalException.new(signm.to_sym).signo, signm)
      assert_equal(signo, SignalException.new(signo).signo, signo)
    end