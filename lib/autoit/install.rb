require 'thor'
require 'byebug'
require 'os'

# Not implemented yet
module Autoit
  # Module to supports CLI commands
  class Install < Thor
    desc 'install', 'Install AutoIt DLLs to run properly.'
    long_desc <<-D
      'install' Install specific AutoIt DLL on your operation system (X86 or 64 bits version).
    D
    option :format
    def install
      path = "#{File.dirname(__FILE__)}\\..\\..\\vendor\\register#{OS.bits}.bat"
      if File.file? path
        system path
      else
        puts "Installation script not found on: [#{path}] Please, open an issue: https://github.com/rpossan/autoit/issues/new"
      end
    end
  end
end
