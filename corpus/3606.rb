do |&blk|
          block_results = []
          RUN_ARRAY.each do |value|
            block_value = blk.call(value)
            block_results.push block_value
          end