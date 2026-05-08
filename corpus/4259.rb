domly hangs on many platforms' if ENV.key?('GITHUB_ACTIONS')
    bug10595 = '[ruby-core:66825] [Bug #10595]'
    src = <<-'end