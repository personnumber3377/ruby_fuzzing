dout:\n```\n#{out}```\n" unless out.empty?
    message << "\nstderr:\n```\n#{err}```\n" unless err.empty?
    assert status.success?, message
  end