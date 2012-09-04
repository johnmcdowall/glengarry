$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "glengarry/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "glengarry"
  s.version     = Glengarry::VERSION
  s.authors     = ["John McDowall"]
  s.email       = ["john@mcdowall.info"]
  s.homepage    = "https://github.com/johnmcdowall/glengarry"
  s.summary     = "A Rails 3.2 engine for capturing email leads."
  s.description = "I HATE THIS FIELD"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.7"
  s.add_dependency "jquery-rails"
  s.add_dependency "kaminari"
  s.add_dependency "geocoder"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
