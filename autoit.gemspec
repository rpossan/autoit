lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "autoit/version"
 Gem::Specification.new do |spec|
  spec.name          = 'autoit'
  spec.version       = Autoit::VERSION
  spec.authors       = ['Ronaldo Possan', 'Fabio Valonga']
  spec.email         = ['ronaldo.possan@gmail.com', 'fabiosv.etep@gmail.com']
  spec.summary       = 'A ruby gem wrapper to interface with AutoIt'
  spec.description   = <<-EOF
    AutoIt is a gem to integrate in your automation project and tests using the AutoIt software for interact with
    Windows OLE objects. With AutoIt gem you can run the easy wrapper methods or run natives AutoIt commands.
  EOF
  spec.homepage      = 'https://github.com/rpossan/autoit'
  spec.license       = 'MIT'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = "https://github.com/rpossan/autoit"
    spec.metadata['changelog_uri'] = "https://github.com/rpossan/autoit/blob/master/CHANGELOG.md"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end
   # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   << "autoit"
  spec.require_paths = ["lib"]
  spec.add_dependency "os"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "byebug", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", ">= 0.49.0"
end
