require 'rubygems'
require 'rake'


spec = Gem::Specification.new do |s|
  s.extensions = FileList["ext/**/extconf.rb"]
  s.name = "kinetosis"
  s.summary = %Q{XYZ orientation from the Apple Sudden Motion Sensor}
  s.description = %Q{Read the XYZ orientation from the Sudden Motion Sensor in most Macbooks.}
  s.email = "peter@c7.se"
  s.homepage    = "https://github.com/peterhellberg/kinetosis"
  s.authors = ["Peter Hellberg, Daniel Cadenas"]
  s.license     = "MIT-LICENSE"

  s.add_development_dependency(%q<rake-compiler>, ["~> 0.8.0"])
  s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])

  s.version = File.read("VERSION")
  s.files = `git ls-files`.split
end

require 'rake/extensiontask'
Gem::PackageTask.new(spec) do |pkg|
end

Rake::ExtensionTask.new('kinetosis_extension', spec)

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-f progress", "-r ./spec/kinetosis_spec.rb"]
  t.pattern = 'spec/*_spec.rb'
end

task :spec => :compile

task :default => :spec
