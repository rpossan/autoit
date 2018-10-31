require 'thor'

module Autoit
  # Module to supports CLI commands
  class CLI < Thor

    desc "migrate INPUT", "Migrate folder or XML file to spreadsheet format"
    long_desc <<-D
      'migrate INPUT' Migrate a file or folder with XML files exported from TesLink to spreadsheet HP Quality Center format.
    D
    option :format
    def migrate(input)
      #require "qaxqa/cli/migrate"
      Migrate.new.run(input)
    end
  end

end