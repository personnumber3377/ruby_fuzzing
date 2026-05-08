do
      File.open(__FILE__) {|file| IO::Buffer.map(file, nil, IO::Buffer::PAGE_SIZE * 100, IO::Buffer::READONLY)}
    end