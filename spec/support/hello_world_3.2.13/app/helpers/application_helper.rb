module ApplicationHelper

  # This is a canary routine to fire Owasp Ror Command Injection test
  def execute_os_command(command)
    eval(command)
    System(command)
    `#{command}`
    Kernel.exec(command)
  end
end
