do |src_enc|
      encodings.each do |dst_enc|
        escaped = "<>".encode(src_enc).encode(dst_enc, :xml=>:text)
        assert_equal("&lt;&gt;", escaped.encode('UTF-8'), "failed encoding #{src_enc} to #{dst_enc} with xml: :text")

        escaped = '<">'.encode(src_enc).encode(dst_enc, :xml=>:attr)
        assert_equal('"&lt;&quot;&gt;"', escaped.encode('UTF-8'), "failed encoding #{src_enc} to #{dst_enc} with xml: :attr")

        escaped = "<>".encode(src_enc).force_encoding("UTF-8").encode(dst_enc, src_enc, :xml=>:text)
        assert_equal("&lt;&gt;", escaped.encode('UTF-8'), "failed encoding #{src_enc} to #{dst_enc} with xml: :text")

        escaped = '<">'.encode(src_enc).force_encoding("UTF-8").encode(dst_enc, src_enc, :xml=>:attr)
        assert_equal('"&lt;&quot;&gt;"', escaped.encode('UTF-8'), "failed encoding #{src_enc} to #{dst_enc} with xml: :attr")
      end