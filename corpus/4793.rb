do
          IO.foreach(t.path, rs, mode:"w") {}
        end