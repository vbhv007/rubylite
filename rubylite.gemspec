
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubylite/version"

Gem::Specification.new do |spec|
  spec.name          = "rubylite"
  spec.version       = Version::VERSION
  spec.authors       = ["vbhv007"]
  spec.email         = ["bhardwajvbhv@gmail.com"]

  spec.summary       = %q{A gem which acts as a command line tool to interact with databases.}
  spec.homepage      = "https://github.com/vbhv007/rubylite"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "amalgalite", "~> 1.6"
end
