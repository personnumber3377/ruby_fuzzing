do
            thrs << Thread.new { AutoloadTest && nil }
            thrs << Thread.new { fork { AutoloadTest } }
          end