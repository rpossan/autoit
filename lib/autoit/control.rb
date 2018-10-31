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

  def click_on(screen, text=nil, id)
    win.WinWaitActive(screen, nil, 30)
    win.ControlClick(screen, text, id)
  end

end