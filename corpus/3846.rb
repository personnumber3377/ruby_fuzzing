do |pr|
      assert_warn(/Skipping set of ruby2_keywords flag for proc \(proc accepts keywords or post arguments or proc does not accept argument splat\)/) do
        pr.ruby2_keywords
      end