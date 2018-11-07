#require 'Win32API'
require 'win32ole'

class Control

  attr_reader :win

  def initialize
    # dll = RUBY_PLATFORM.include? 'x64' ? a : b
    @win = WIN32OLE.new('AutoItX3.Control')
  end

  def command(cmd, opt)
    win.send(cmd, opt)
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

  # Use to activate an opened window
  # title: The title/hWnd/class of the window to activate.
  # text: [optional] The text of the window to activate. Default is an empty string.
  def window_activate(title, text=nil)
    win.WinActivate(title, text)
  end
end
