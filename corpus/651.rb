do
        assert_equal obj, ObjectSpace._id2ref(obj.object_id)
      end