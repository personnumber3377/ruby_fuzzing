don't know Ruby's spec about "unlink-before-close" exactly.
  # This test asserts current behaviour.
  def test_unlink_before_close
    Dir.mktmpdir('rubytest-file') {|tmpdir|
      filename = tmpdir + '/' + File.basename(__FILE__) + ".#{$$}"
      w = File.open(filename, "w")
      w << "foo"
      w.close
      r = File.open(filename, "r")
      begin
        if /(mswin|bccwin|mingw|emx)/ =~ RUBY_PLATFORM
          assert_raise(Errno::EACCES) {File.unlink(filename)}
        else
          assert_nothing_raised {File.unlink(filename)}
        end