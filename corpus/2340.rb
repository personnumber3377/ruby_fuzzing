do
          undef_method op
          alias_method op, :orig
        end