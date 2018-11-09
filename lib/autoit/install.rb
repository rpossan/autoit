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
      system "vendor\\register#{OS.bits}.bat"
    end
  end
end
