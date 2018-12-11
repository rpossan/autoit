![AutoIt Logo](https://www.autoitscript.com/images/logo_autoit_210x72@2x.png "AutoIt Logo")Ruby Version

#
AutoIt is a gem to handle and integrate Windows Automation in your project and tests using the AutoIt software and Windows OLE
objects. With AutoIt gem you can run easily wrapper methods or run natives AutoIt commands.

>We are building a new concept to match Windows elements called WPath. Yes, this is similar to the known XPath and we are
trying to bring this feature to easily find elements on the screen. For example: `//Calculator/Button[@id=135]` will match an
element on the screen with title 'Calculator', with class Button and ID 135.

We recommend to build a project structure using BDD Cucumber (http://cucumber.io) with the gem BDDFire (https://github.com/Shashikant86/bddfire) to have a complete and full of features tool for your automation project focused highly on your business, not just in code.

Enjoy this awesome project together. Use, review, contribute and give us a <a class="github-button" href="https://github.com/rpossan/autoit" data-icon="octicon-star" aria-label="Star rpossan/autoit on GitHub">STAR</a>!

See its running on IRB (Interactive Ruby mode):
![](https://github.com/rpossan/files/blob/master/autoit/autoit_irb.gif)

1. [Installation](#1---installation)
2. [Usage](#2---usage)
3. [Basics - Getting started](#3---basics---getting-started)
4. [Development](#4---development)
5. [Contributing](#5---contributing)
6. [License](#6---license)
7. [Code of Conduct](#7---code-of-conduct)
8. [Support](#8---support)

## 1 - Installation

Add this line to your application's Gemfile:

```ruby
gem 'autoit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autoit

AutoIt Installation:

AutoIt gem has a executable 'autoit' with the command 'install' to install the AutoIt DLL's for Operating System 32 or 64 bits.

You can install autoit manually by yourself following the instructions: https://www.autoitscript.com/site/autoit/downloads/

If you have already installed AutoIt DLLs on your system ignore this step.

DLLs are located and will be up to date on the folder: https://github.com/rpossan/autoit/tree/master/vendor

```sh
$ autoit install
```

System will ask for Administrator access. Click on "Yes" to register the properly DLL on your system register.

![](https://github.com/rpossan/files/blob/master/autoit/autoit_install.gif)

## 2 - Usage

The basics of usage is very simples.
First step you need to instance an object (or call directly) from the class Control of AutoIt module.

```ruby
control = AutoIt::Control.new
```

Once object instanced, you can call the method "command" to run native AutoIt commands exactly how you can see in the
AutoIt library documentation: https://www.autoitscript.com/autoit3/docs/functions/.

First argument of this method is the command that you want to run following of the  AutoIt function arguments.

```ruby
control.command('run', ['calc']) # Open the Windows calculator

# Click on element located by 'Calculator' title, '8' text and ID 138
control.command('ControlClick', ['Calculator', '8', '[ID:138]'])
```
This example of use is exaclty as AutoIt ControlClick funtcion documentation: https://www.autoitscript.com/autoit3/docs/functions/ControlClick.htm

Using ruby wrapper methods:

>_This is UNDER construction - Keep your autoit gem up to date to get all features_
```ruby
# Open app and run executables
control.open_app('calc') # open Windows calculator. Can be a executable or path to an .exe file

# Closing windows
control.win_close 'Calculator' # close window with title 'Calculator'

# Clicking elements
control.click_on('Calculator', '[ID:135]', '5') # click on element with window title 'Calculator', ID 135 and text '5'
control.click_on('135') # Click on first element found with id 135
control.click_on({class: "Button", instance: 9, id: 138, text: "5"}) #Using a hash of arguments
control.click_on('//Calculator[@id=135]') # Using WPath - Our innovative way to match elements by paths, similar to XPath for HTML

# Check if it has a given integer value on the window with title Calculator
control.has_int?('Calculator', 10)

# Check if it has a given text on the window with title Calculator
control.has_int?('Calculator', "MC")
```

Example of how to automate the sum using the Windows Calculator with wrapper methods:
```ruby
my_control = AutoIt::Control.new # instance object
my_control.click_on('Calculator', '[ID:135]', '5') # click on '5'
my_control.click_on('Calculator', '[ID:93]', '+')  # click on '+'
my_control.click_on('Calculator', '[ID:135]', '5') # click on '5'
my_control.click_on('Calculator', '[ID:121]', '=') # click on '='

if my_control.has_int?('Calculator', 10)
  puts "Yes, I see 10 text on the the result element!"
end

my_control.win_close 'Calculator' # Close window with 'Calculator' title
```

Same example but now using native commands of AutoIt DLL:
```ruby
my_control = AutoIt::Control.new # instance object
key_8 = ['Calculator', '8', '[ID:138]'] # An array with options
my_control.command('run', ['calc']) # Execute AutoIt native run command
my_control.command('WinWaitActive', ['Calculator', nil, 30]) # Execute AutoIt native WinWaitActive
my_control.command('ControlClick', key_8) # Execute AutoIt native ControlClick clicking with key_8 variable args
my_control.command('WinClose', ['Calculator']) # Close window passing the title
```

## 3 - Basics - Getting started

* Install Ruby: Linux is recommended to use http://rvm.io. For Windows use Ruby Installer (Next, next ... Finish): https://rubyinstaller.org/

* In command line test your environment:
```sh
$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x64-mingw32]
```

* Install autoit gem or use on a Bundler project (https://bundler.io/):
```sh
$ gem install autoit
Successfully installed autoit-0.2.0
Parsing documentation for autoit-0.2.0
Done installing documentation for autoit after 1 seconds
1 gem installed
```

* Start using and implement your project. We recommend to build a project structure using BDD Cucumber (http://cucumber.io)
with the gem BDDFire (https://github.com/Shashikant86/bddfire) to have a complete and full of features tool for your
automation project focused highly on your business, not just in coding.

## 4 - Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## 5 - Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rpossan/autoit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/0)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/0)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/1)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/1)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/2)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/2)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/3)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/3)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/4)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/4)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/5)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/5)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/6)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/6)
[![](https://sourcerer.io/fame/fabiosv/rpossan/autoit/images/7)](https://sourcerer.io/fame/fabiosv/rpossan/autoit/links/7)

## 6 - License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## 7 - Code of Conduct

Everyone interacting in the Autoit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rpossan/autoit/blob/master/CODE_OF_CONDUCT.md).


## 8 - Support
You can starting contacting the developer team members or just openning an issue in the project:
https://github.com/rpossan/autoit/issues

For more details, please send me an e-mail. I'll have the pleasure talking to you: ronaldo.possan@gmail.com