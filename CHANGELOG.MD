## 1.3.2 (2018-12-12)

Changes:

  - Bug fixes and documentation.

Bugfixes:

  - Fixes the 'open_app' method passing empty string or nil resulting in
  ruby interpreter crash. Now it has a treatment to check the arguments before
  call the command. It works for open_app method and native commands.
  - Fixes the broken URLS in README.

Documentation:

  - Created a complete version of README file