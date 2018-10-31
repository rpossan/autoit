require 'thor'

module Autoit
  # Module to supports CLI commands
  class CLI < Thor

    desc "install INPUT", "Install Platform"
    long_desc <<-D
      'install INPUT' Install platform on Windows.
    D
    option :format
    def install(input)
      system "vendor/register.bat"
    end
  end

end