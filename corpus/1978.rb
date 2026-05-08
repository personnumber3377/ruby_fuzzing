do |ary|
      ary_id = ary.object_id
      assert_equal ary_id, :object_id.to_proc.call(ary)
      ary_ids = ary.collect{|x| x.object_id }
      assert_equal ary_ids, ary.collect(&:object_id)
    end