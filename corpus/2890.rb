do
      File.open(__FILE__) {|file| IO::Buffer.map(file, -10, 0, IO::Buffer::READONLY)}
    end