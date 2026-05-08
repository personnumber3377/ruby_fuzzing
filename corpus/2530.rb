do |th|
            pid = th.value or next
            _, status = Process.waitpid2(pid)
            assert_predicate status, :success?
          end