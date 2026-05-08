do
      File.open(__FILE__) {|file| IO::Buffer.map(file, File.size(__FILE__) + 1, 0, IO::Buffer::READONLY)}
    end