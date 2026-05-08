do
            make_tempfile {|tf2|
              tf2.advise(adv.to_sym, offset, len)
            }
          end