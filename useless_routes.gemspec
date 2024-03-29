require_relative "lib/useless_routes/version"

Gem::Specification.new do |spec|
  spec.name        = "useless_routes"
  spec.version     = UselessRoutes::VERSION
  spec.authors     = ["MartinFesneau", "rhaddad5", "HADDADSOHAIB"]
  spec.email       = ["86001610+Martin-hoggo@users.noreply.github.com"]
  spec.homepage    = "http://www.hoggo.com"
  spec.summary     = "Summary of UselessRoutes."
  spec.description = "Description of UselessRoutes."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.hoggo.com"
  spec.metadata["changelog_uri"] = "http://www.hoggo.com"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
  spec.add_dependency "colorize", '~> 0.8.1'
end
