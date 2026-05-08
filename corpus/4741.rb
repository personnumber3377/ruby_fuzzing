dom sequential willneed dontneed noreuse}.map(&:to_sym).each do |adv|
        [[0,0], [0, 20], [400, 2]].each do |offset, len|
          open(tf.path) do |t|
            ret = assert_nothing_raised(lambda { os_and_fs(tf.path) }) {
              begin
                t.advise(adv, offset, len)
              rescue Errno::EINVAL => e
                if /linux/ =~ RUBY_PLATFORM && (Etc.uname[:release].split('.').map(&:to_i) <=> [3,6]) < 0
                  next # [ruby-core:65355] tmpfs is not supported
                else
                  raise e
                end