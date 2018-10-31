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

  def click_on(title, text=nil, id)
    win.WinWaitActive(title, nil, 30)
    win.ControlClick(title, text, id)
  end

  def get_text(title)
    win.WinGetText(title)
  end

  def has_text?(title, text, get_int=false)
    found = get_text title
    found = text.to_i.to_s if get_int
    found == text
  end

end