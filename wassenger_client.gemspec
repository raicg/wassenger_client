$:.push File.expand_path("../lib", __FILE__)

# require 'wassenger_client/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wassenger_client"
  s.authors     = ["Raí Gondim", "Wilbert Ribeiro"]
  s.email       = ["raicg2@gmail.com", "wkelyson@gmail.com"]
  s.version     = '0.2.1'
  s.homepage    = "https://www.github.com/raicg/wassenger_client"
  s.summary     = "Ruby client for wassenger.com API"
  s.description = "Ruby client for wassenger.com API"
  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
  s.licenses    = ['MIT']
  s.required_ruby_version = '~> 2.2'

  s.add_dependency 'rails'

  s.add_development_dependency 'rspec-rails', '3.9.0'
end
