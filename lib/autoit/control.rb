# require 'Win32API'
require 'win32ole'

module AutoIt
  # Class module to execute control commands on AutoIt DLL. Its possible
  # to run native commands and some methods for object
  class Control
    attr_reader :win

    def initialize
      # dll = RUBY_PLATFORM.include? 'x64' ? a : b
      @win = WIN32OLE.new('AutoItX3.Control')
    end

    def command(cmd, args = {})
      execute { win.send(cmd, *args) }
    end

    def win_close(title)
      execute { win.WinClose title }
    end

    def open_app(app)
      execute { win.run app }
    end

    def click_on(title, id, text = nil)
      execute do
        win.WinWaitActive(title, nil, 30)
        win.ControlClick(title, text, id)
      end
    end

    def get_text(title)
      win.WinGetText(title)
    end

    def text?(title, text, get_int = false)
      found = get_text title
      found = text.to_i.to_s if get_int
      found == text
    end

    # Use to activate an opened window
    # title: The title/hWnd/class of the window to activate.
    # text: [optional] The text of the window to activate. Default is an empty
    # string.
    def window_activate(title, text = nil)
      win.WinActivate(title, text).nil?
    end

    # Check if a windows is active or not
    # title: The title/hWnd/class of the window to activate.
    # text: [optional] The text of the window to activate. Default is an empty
    # string.
    # return: true or false
    def window_active?(title, text = '')
      sleep 3
      execute { win.WinActive(title, text) }
    end

    # Check if a windows exists or not
    # title: The title/hWnd/class of the window to activate.
    # text: [optional] The text of the window to activate. Default is an empty
    # string.
    # return: true or false
    def window_exists?(title, text = '')
      sleep 3
      execute { win.WinExists(title, text) }
    end

    private

    def execute
      yield > 0
    end
  end
end
