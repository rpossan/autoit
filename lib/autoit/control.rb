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
      raise "Parameter: '#{app}' is invalid!" if app.nil? || app.empty?
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

    def has_int?(title, value)
      found = get_text title
      found.to_i == value
    end

    def has_text?(title, text)
      found = get_text title
      found.to_s.chomp == text.to_s
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

    # Activates (gives focus to) a window.
    # title: The title/hWnd/class of the window to activate.
    def winActivate(*args)
      if args == 1
        command'WinActivate', [args[0]]
      elsif args == 2
        command'WinActivate', [args[0], args[1]]
      end
    end

    # Closes a window.
    # title: The title/hWnd/class of the window to activate.
    def winClose (title)
      command'WinClose', [title]
    end

    # Sets input focus to a given control on a window.
    # title: The title of the window to access.
    # text: The text of the window to access.
    # control: The control to interact with.
    def controlFocus(title, text, control)
      command 'ControlFocus', [title, text, control]
    end

    # Sends simulated keystrokes to the active window.
    # keys: The sequence of keys to send.
    def send keys
      command 'Send', [keys, 1]
    end

    # Sets selection according to string in a ListBox or ComboBox
    # title: The title of the window to access.
    # text: The text of the window to access.
    # control: The control to interact with.
    # string: The string.
    def controlCommandSelectString(title, text, control, string)
      command 'ControlCommand', [title, text, control, 'SelectString', string]
    end

    # Sets text of a control.
    # Sends a string of characters to a control.
    # title: The title of the window to access.
    # text: The text of the window to access.
    # control: The control to interact with.
    # string: The string.
    def ControlSetText(title, text, control, value)
      command'ControlSetText', [title, text, control, value]
    end
    # Sends a mouse click command to a given control.
    # title The title of the window to access.
    # text The text of the window to access.
    # controlID The control to interact with.
    # button The button to click, "left", "right" or "middle".
    # clicks The number of times to click the mouse. Default is center.
    # x The x position to click within the control. Default is center.
    # y The y position to click within the control. Default is center.
    def ControlClick(title, text, control, button, clicks, x, y)
      command("ControlClick", [title, text, control, button, clicks, x, y])
    end
    private

    def execute
      yield
    end
  end
end
