do
      File.open(__FILE__) {|file| IO::Buffer.map(file, 200_000, 0, IO::Buffer::READONLY)}
    end