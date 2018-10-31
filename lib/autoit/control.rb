#require 'Win32API'
require 'win32ole'

class Control
  
  attr_reader :win

  def initialize
    @win = WIN32OLE.new('AutoItX3.Control')
  end

  def open_app(app)
    win.run app
  end

end