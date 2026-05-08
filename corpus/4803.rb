done'
      assert_same noex, noex.join(20), '"good" writer timeout'
      assert_equal 'done', noex.value ,'r63216'
    end