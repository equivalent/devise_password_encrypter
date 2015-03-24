# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_password_encrypter/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_password_encrypter"
  spec.version       = DevisePasswordEncrypter::VERSION
  spec.authors       = ["Tomas Valent"]
  spec.email         = ["equivalent@eq8.eu"]
  spec.summary       = %q{password encrypter}
  spec.description   = %q{password encrypter extracted from Devise gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bcrypt", '~> 3.1.10'
  spec.add_dependency "activesupport"  # used only for blank? so no spec version required
  spec.add_development_dependency "minitest", "~> 5"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
