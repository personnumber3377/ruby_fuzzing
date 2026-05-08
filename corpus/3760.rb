do |tmp|
        Tempfile.create(%w[feature .rb], tmp) do |file|
          file.close
          path = File.realpath(file.path)
          dir, base = File.split(path)
          $:.unshift(dir)
          assert_equal([:rb, path], $LOAD_PATH.resolve_feature_path(base))
          $".push(path)
          assert_equal([:rb, path], $LOAD_PATH.resolve_feature_path(base))
        end