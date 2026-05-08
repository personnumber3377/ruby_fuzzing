do
            t1 = Thread.new { ::AutoloadTest::X }
            t2 = Thread.new { ::AutoloadTest::X }
            [t1, t2].each(&:join)
          end