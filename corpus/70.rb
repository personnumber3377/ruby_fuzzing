do |dev_null|
      ("aa".."zz").each do |c|
        fstr = -(c + pad).freeze
        dev_null.write(fstr)
      end