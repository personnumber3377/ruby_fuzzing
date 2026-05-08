do |bool, members|
            res << Ruby::Box.current.object_id.to_s + ":" + bool.to_s + ":" + members.map(&:to_s).join(",")
          end