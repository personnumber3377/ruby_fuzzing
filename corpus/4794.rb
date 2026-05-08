do
          IO.foreach(t.path, lim, mode:"w") {}
        end