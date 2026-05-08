do |_, key|
        class String
          undef :freeze
          def freeze = :ugokanai
        end