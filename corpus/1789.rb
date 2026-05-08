do |num_arrays, num_hashes, check_code|
        instance_eval <<~RB
          empty_array = empty_array = []
          empty_hash = empty_hash = {}
          array1 = array1 = [1]
          r2k_array = r2k_array = [Hash.ruby2_keywords_hash(a: 3)]
          r2k_array1 = r2k_array1 = [1, Hash.ruby2_keywords_hash(a: 3)]
          r2k_empty_array = r2k_empty_array = [Hash.ruby2_keywords_hash({})]
          r2k_empty_array1 = r2k_empty_array1 = [1, Hash.ruby2_keywords_hash({})]
          hash1 = hash1 = {a: 2}
          nill = nill = nil
          block = block = lambda{}

          num_allocations do
            \#{check_code}
          end