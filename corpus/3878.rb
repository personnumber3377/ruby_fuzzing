do |str: "foo", num: 424242, **h, &blk|
      [str, num, h, blk]
    end