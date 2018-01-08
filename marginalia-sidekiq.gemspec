
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "marginalia/sidekiq/version"

Gem::Specification.new do |spec|
  spec.name          = "marginalia-sidekiq"
  spec.version       = Marginalia::Sidekiq::VERSION
  spec.authors       = ["Richard Lee"]
  spec.email         = ["rl@polydice.com"]

  spec.summary       = %q{Integrate Marginalia with Sidekiq.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/polydice/marginalia-sidekiq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "marginalia", ">= 1.1.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
