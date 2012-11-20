lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'kinetosis/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 1.8.7'
  s.extensions  = ["ext/extconf.rb"]

  s.name        = "kinetosis"
  s.platform    = Gem::Platform::CURRENT
  s.version     = Kinetosis::VERSION
  s.summary     = "XYZ orientation from the Apple Sudden Motion Sensor"
  s.description = "Read the XYZ orientation from the Sudden Motion Sensor in most Macbooks."
  s.email       = "peter@c7.se"
  s.homepage    = "https://github.com/peterhellberg/kinetosis"
  s.authors     = ["Peter Hellberg"]
  s.license     = "MIT-LICENSE"

  s.requirements << "Apple laptop with the Sudden Motion Sensor"
  s.requirements << "Snow Leopard (probably)"

  s.has_rdoc          = true
  s.rdoc_options      = ['--main', 'README.rdoc', '--charset=UTF-8']
  s.extra_rdoc_files  = ['README.rdoc', 'MIT-LICENSE']

  s.test_file         = 'spec/kinetosis_spec.rb'

  s.files             = Dir.glob("lib/**/*") +
                        %w(MIT-LICENSE README.rdoc Rakefile .gemtest) +
                        %w(ext/extconf.rb ext/kinetosis.c)

  s.add_development_dependency('minitest')
end

