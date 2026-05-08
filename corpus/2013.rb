do |f|
	File.symlink(File.join(@root, f),
		     File.join(@root, "symlink-#{ f }"))
      end