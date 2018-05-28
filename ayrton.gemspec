
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ayrton/version"

Gem::Specification.new do |spec|
  spec.name          = "ayrton"
  spec.version       = Ayrton::VERSION
  spec.authors       = ["jvillarejo"]
  spec.email         = ["arzivian87@gmail.com"]

  spec.summary       = %q{Gem for Gympass Interview}
  spec.description   = spec.summary
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
