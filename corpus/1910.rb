do |stdout, stderr,|
        assert_empty(stdout)
        assert_not_empty(stderr.grep(pattern))
        error, = stderr.grep(/unexpected end