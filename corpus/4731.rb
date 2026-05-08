do |mode|
        assert_raise(Errno::EINVAL, "#{mode} [ruby-dev:38571]") {IO.new(fd, mode)}
      end