# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'djstat/version'

Gem::Specification.new do |spec|
  spec.name          = "djstat"
  spec.version       = Djstat::VERSION
  spec.authors       = ["Roman Charushin"]
  spec.email         = ["asromanist@gmail.com"]

  spec.summary       = %q{Commits counter for git repo}
  spec.description   = %q{Count commits, additions, deletions in git repo and sort by them}
  spec.homepage      = "https://github.com/lompy/djstat"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["djstat"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
