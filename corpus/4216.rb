do
      expect = case
               when search < from
                 from
               when search.send