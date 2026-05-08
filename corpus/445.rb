do
        begin
          g = IO.popen([RUBY, "-e", "print Process.gid", gid: group], &:read)
          # AIX allows a non-root process to setgid to its supplementary group,
          # while other UNIXes do not. (This might be AIX's violation of the POSIX standard.)
          # However, Ruby does not allow a setgid'ed Ruby process to use the -e option.
          # As a result, the Ruby process invoked by "IO.popen([RUBY, "-e", ..." above fails
          # with a message like "no -e allowed while running setgid (SecurityError)" to stderr,
          # the exis status is set to 1, and the variable "g" is set to an empty string.
          # To conclude, on AIX, if the "gid" variable is a supplementary group,
          # the assert_equal next can fail, so skip it.
          assert_equal(gid, g, feature6975) unless $?.exitstatus == 1 && /aix/ =~ RUBY_PLATFORM && gid != Process.gid
        rescue Errno::EPERM, NotImplementedError
        end