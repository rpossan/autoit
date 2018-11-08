# Autoit

![AutoIt Logo](https://www.autoitscript.com/images/logo_autoit_210x72@2x.png "AutoIt Logo")Ruby Version

#
1. [Gem](#Gem)
1.2 [Installation](installation)
1.3 [Usage](#usage)
2. [Development](#dev)
3. [Contributing](#contributing)
4. [License](#license)
5. [Support](#support)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'autoit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autoit

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/autoit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Autoit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/autoit/blob/master/CODE_OF_CONDUCT.md).




It's a Ruby gem to rip Instagram data such as posts, images, videos or users profiles info.There is also a user interface to fetch this data. This article provides the context bellow:

  - Gem documantation, features and How-To
  - User Interface and Architecture
  - Examples and how-tos
 



## 1 Gem
The gem was developed to fetch data from Instagram webpage through web crawler using Capybara to manipulate the page and PhantomJs to execute in background and headless.
The gem depends on the bellow gems:

| Gem   |      Purpose      |
|----------|:-------------:
| byebug |  Debugging and tests |
| capybara |    Simulates users interaction with the webpage   |
| nokogiri | Fetch and parse HTML code from pages |
| open-uri | Http requests from web  |
| poltergeist | A PhantomJS driver for Capybara |
| PhantomJS | A external driver to run tests headless |

* Optionally is possible to use other drives like Chromedriver, IEDriver, etc.

## 1.1 Basics
It has the simple gem skeleton where the main code stay in lib diretory.
Drivers folder has the drivers to manipulate webpage interactions.
Instagram folder has the main classes and modules.
Ripper folder has the gem version file.
**Ripper.rb**: Main module responsible to setup and prepare gem how to fetch data.
**Instagram.json**: The main output file to get as example when data is extracted.
**Location.rb**: This module parse data from a location profile.
**Profile.rb**: This module parse data from an users profile.
**Media.rb**: Is the core module to get data from both user and location profile. It is responsible to build structure, navigate pages, extract data, parse html codes and generate outputs.

The gem can be used locally installing through the bundler or starting th console mode of gem.

##### Bundle Installation:
```sh
$ bundle install [PATH TO GEM]
$ irb
$ require 'instagram-ripper'
#code
```
##### Console Mode:
```sh
$ cd [PATH TO GEM]
$ bin/console
#code
```
## 1.2 Drivers
The gem allow to run processes into a browser like a Chrome, Internet Explorer or Firefox. But native it runs headless (without a browser, only commands) with the software PhantomJS.
Initially the gem provides support to Mozillla Selenium webdriver and Poltergeist (headless) driver.
If you want to run through other browsers like Chrome or internet Explorer, you need to implement and extend a new module.
New modules are in the folder **lib/drivers**. Base.rb is the main module and it has the method **initialize_driver(driver)** where param is the symbol of your desired driver.
To implement new driver, you can copy other modules and renames files and module name to your desired name so, on initialize methdos, define your driver setup.

## 1.3 Setup
The main configuration is the module Ripper (lib/instagram/ripper.rb).
In this module, you can set up the bellow constants:
**INSTAGRAM_URI**: The base Instagram URL. Default: https://instagram.com/
**DEFAULT_DRIVER**: Driver responsible to run automation scripts on the webpages. Default is poltergeist to run headless (without a browser) and to be more performatic. If you want to see what is happening during the execution, run with a browser driver. The gem has implemented Selenium Firefox browser to test scripts. Change this value to :selenium to see web navigation. If you desire to run another browsers, implement a new module and configure you driver.
**DEFAULT_MEDIA_LIMIT**: Limit of media to be ripped. Default is 30 but actually has no limit, as client required. It is important to se a limit because with no limits the process can last long and kill all the process.
**USER_AGENT**: User agent to be used and simulated when the gem navigates on web. Some web pages block IPs when it requires many requests on the page. Using an agent it simulates a real user and avoid to be blocked. Default vaue is: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36". Feel free to use any agent.
**READ_TIMEOUT**:  Limit time to wait page to respond, used for Nokogiri.Default is 5 seconds.
#### Methods
##### authenticate (username, password)
Method to authenticate an user to Instagram passing string of username and password. It is usefull to private profiles that requer authentication on Instagram. Caution: It does not work if the profile that your trying to fetch has not auhotized logged user on gem session.
##### configure_driver (:symbol)
Pass a symbol representative of a driver you want to configure. The module driver has to be implemented. This method can be utilized during a fetch process.

## Setting up a Profile
Before start to rip an Instagram Profile, you need to initialize a new object. It can be an User or Location Profile. In case of Location profile the param may be an integer represanting ID identificator of the location.

```ruby
user = Instagram::Profile.new "rpossan"
# Or Location Profile
location = Instagram::Location.new 012345678
```

## 3.0 Support
Both gem and ui application was developed by Ronaldo Possan. Feel free to contact me for support doubts, help, architecture or consult bugs:
@rpossan or ronaldo.possan@gmail.com
I will not mantain more gem and ui application.
