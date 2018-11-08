lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autoit/version'

Gem::Specification.new do |spec|
  spec.name          = 'autoit'
  spec.version       = Autoit::VERSION
  spec.authors       = ['Ronaldo Possan']
  spec.email         = ['ronaldo.possan@gmail.com']
  spec.summary       = 'A ruby gem wrapper to interface with AutoIt'
  spec.description   = 'An interface to execute and automate Windows platform\
                        using AutoIt'
  spec.homepage      = 'https://github.com/rpossan/autoit'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/rpossan/autoit'
    spec.metadata['changelog_uri'] = 'https://github.com/rpossan/autoit/blob/master/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split('\x0').reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'thor'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'byebug', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '>= 0.49.0'
end
