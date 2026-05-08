do
      File.open(__FILE__) {|file| IO::Buffer.map(file, 20, -1, IO::Buffer::READONLY)}
    end